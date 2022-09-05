package com.example.weblogincore.infrastructure.persistence.adapter;

import com.example.weblogincore.domain.model.form.questions.Question;
import com.example.weblogincore.domain.persistence.QuestionRepository;
import com.example.weblogincore.infrastructure.persistence.jpa.QuestionJPA;
import com.example.weblogincore.infrastructure.persistence.mapper.FormEntityMapper;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class QuestionRepositoryMysql implements QuestionRepository {

    private final QuestionJPA questionJPA;
    private final FormEntityMapper formEntityMapper;

    public QuestionRepositoryMysql(QuestionJPA questionJPA, FormEntityMapper formEntityMapper) {
        this.questionJPA = questionJPA;
        this.formEntityMapper = formEntityMapper;
    }

    @Override
    public Optional<Question> findById(Long id) {
        return questionJPA.findById(id)
                .map(formEntityMapper::toDomain);
    }
}
