package com.example.weblogincore.domain.services;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.persistence.AttemptRepository;
import org.springframework.stereotype.Component;

@Component
public class AttemptRetriever {
    private final AttemptRepository attemptRepository;

    public AttemptRetriever(AttemptRepository attemptRepository) {
        this.attemptRepository = attemptRepository;
    }

    public Attempt findById(Long id) {
        return attemptRepository.findByid(id)
                .orElseThrow(RuntimeException::new);
    }
}
