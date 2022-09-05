package com.example.weblogincore.domain.services;

import com.example.weblogincore.domain.model.form.questions.Question;
import com.example.weblogincore.domain.persistence.QuestionRepository;
import org.springframework.stereotype.Component;

@Component
public class QuestionRetriever {

    private final QuestionRepository questionRepository;

    public QuestionRetriever(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    public Question findById(Long id) {
        return questionRepository.findById(id)
                .orElseThrow(RuntimeException::new);
    }
}
