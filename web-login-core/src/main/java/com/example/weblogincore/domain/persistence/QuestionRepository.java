package com.example.weblogincore.domain.persistence;

import com.example.weblogincore.domain.model.form.questions.Question;

import java.util.Optional;

public interface QuestionRepository {
    Optional<Question> findById(Long id);
}
