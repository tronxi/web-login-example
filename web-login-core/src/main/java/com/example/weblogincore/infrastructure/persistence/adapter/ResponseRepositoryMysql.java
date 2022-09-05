package com.example.weblogincore.infrastructure.persistence.adapter;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.DeleteResponseOrder;
import com.example.weblogincore.domain.model.form.Response;
import com.example.weblogincore.domain.persistence.ResponseRepository;
import com.example.weblogincore.infrastructure.persistence.entities.form.AttemptEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.QuestionEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.ResponseEntity;
import com.example.weblogincore.infrastructure.persistence.jpa.AttemptJPA;
import com.example.weblogincore.infrastructure.persistence.jpa.QuestionJPA;
import com.example.weblogincore.infrastructure.persistence.jpa.ResponseJPA;
import com.example.weblogincore.infrastructure.persistence.mapper.AttemptEntityMapper;
import com.example.weblogincore.infrastructure.persistence.mapper.ResponseEntityMapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ResponseRepositoryMysql implements ResponseRepository {
    private final ResponseEntityMapper responseEntityMapper;
    private final AttemptEntityMapper attemptEntityMapper;
    private final ResponseJPA responseJPA;
    private final AttemptJPA attemptJPA;
    private final QuestionJPA questionJPA;

    public ResponseRepositoryMysql(ResponseEntityMapper responseEntityMapper, AttemptEntityMapper attemptEntityMapper, ResponseJPA responseJPA, AttemptJPA attemptJPA, QuestionJPA questionJPA) {
        this.responseEntityMapper = responseEntityMapper;
        this.attemptEntityMapper = attemptEntityMapper;
        this.responseJPA = responseJPA;
        this.attemptJPA = attemptJPA;
        this.questionJPA = questionJPA;
    }

    @Override
    public Response save(Response response) {
        ResponseEntity responseEntity = responseEntityMapper.toEntity(response);
        ResponseEntity savedEntity = responseJPA.save(responseEntity);
        return responseEntityMapper.toDomain(savedEntity);
    }

    @Override
    public void delete(DeleteResponseOrder deleteResponseOrder) {
        AttemptEntity attemptEntity = attemptJPA.findById(deleteResponseOrder.getAttemptId())
                .orElse(new AttemptEntity());
        QuestionEntity questionEntity = questionJPA.findById(deleteResponseOrder.getQuestionId())
                .orElse(new QuestionEntity());
        responseJPA.deleteAll(responseJPA.findByAttemptEntityAndQuestionEntity(attemptEntity, questionEntity));
    }

    @Override
    public List<Response> findByAttempt(Attempt attempt) {
        AttemptEntity attemptEntity = attemptEntityMapper.toEntity(attempt);
        return responseJPA.findByAttemptEntity(attemptEntity).stream()
                .map(responseEntityMapper::toDomain)
                .collect(Collectors.toList());
    }
}
