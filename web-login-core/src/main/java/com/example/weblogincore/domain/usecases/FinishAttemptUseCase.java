package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.AttemptStatus;
import com.example.weblogincore.domain.persistence.AttemptRepository;
import com.example.weblogincore.domain.services.AttemptRetriever;
import org.springframework.stereotype.Component;

@Component
public class FinishAttemptUseCase {

    private final AttemptRepository attemptRepository;
    private final AttemptRetriever attemptRetriever;

    public FinishAttemptUseCase(AttemptRepository attemptRepository, AttemptRetriever attemptRetriever) {
        this.attemptRepository = attemptRepository;
        this.attemptRetriever = attemptRetriever;
    }

    public Attempt finish(Long attemptId) {
        Attempt attempt = attemptRetriever.findById(attemptId);
        Attempt finishedAttempt = new Attempt(attemptId, attempt.getUser(), attempt.getForm(), AttemptStatus.FINISHED);
        return attemptRepository.save(finishedAttempt);
    }
}
