package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.FinishedForm;
import com.example.weblogincore.domain.model.form.Response;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.persistence.AttemptRepository;
import com.example.weblogincore.domain.persistence.ResponseRepository;
import com.example.weblogincore.domain.services.UserRetriever;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class RetrieveFinishedFormsUseCase {

    private final UserRetriever userRetriever;
    private final AttemptRepository attemptRepository;
    private final ResponseRepository responseRepository;

    public RetrieveFinishedFormsUseCase(UserRetriever userRetriever, AttemptRepository attemptRepository, ResponseRepository responseRepository) {
        this.userRetriever = userRetriever;
        this.attemptRepository = attemptRepository;
        this.responseRepository = responseRepository;
    }

    public List<FinishedForm> retrieveByUser(Long userId) {
        User user = userRetriever.findById(userId);
        List<Attempt> finishedAttempts = attemptRepository.findFinishedByUser(user);
        return finishedAttempts.stream()
                .map(this::retrieveFinished)
                .collect(Collectors.toList());
    }

    private FinishedForm retrieveFinished(Attempt attempt) {
        List<Response> responses = responseRepository.findByAttempt(attempt);
        return new FinishedForm(attempt.getForm(), responses);
    }
}
