package com.example.weblogincore.infrastructure.persistence.mapper;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.questions.Question;
import com.example.weblogincore.domain.model.form.Response;
import com.example.weblogincore.infrastructure.persistence.entities.form.AttemptEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.QuestionEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.ResponseEntity;
import com.example.weblogincore.infrastructure.persistence.jpa.QuestionJPA;
import org.springframework.stereotype.Component;

@Component
public class ResponseEntityMapper {

    private final AttemptEntityMapper attemptEntityMapper;
    private final FormEntityMapper formEntityMapper;
    private final QuestionJPA questionJPA;

    public ResponseEntityMapper(AttemptEntityMapper attemptEntityMapper, FormEntityMapper formEntityMapper, QuestionJPA questionJPA) {
       this.attemptEntityMapper = attemptEntityMapper;
        this.formEntityMapper = formEntityMapper;
        this.questionJPA = questionJPA;
    }

    public ResponseEntity toEntity(Response response) {
        AttemptEntity attemptEntity = attemptEntityMapper.toEntity(response.getAttempt());
        QuestionEntity questionEntity = questionJPA.getById(response.getQuestion().getId());
        return new ResponseEntity(attemptEntity, questionEntity, response.getResponse());
    }

    public Response toDomain(ResponseEntity responseEntity) {
        Attempt attempt = attemptEntityMapper.toDomain(responseEntity.getAttemptEntity());
        Question question = formEntityMapper.toDomain(responseEntity.getQuestionEntity());
        return new Response(attempt, question, responseEntity.getResponse());
    }
}
