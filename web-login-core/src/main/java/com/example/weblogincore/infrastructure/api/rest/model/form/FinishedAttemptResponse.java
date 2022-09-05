package com.example.weblogincore.infrastructure.api.rest.model.form;

import java.util.List;

public class FinishedAttemptResponse {
    private AttemptResponse attempt;
    private List<ResponseResponse> responses;

    public FinishedAttemptResponse(AttemptResponse attempt, List<ResponseResponse> responses) {
        this.attempt = attempt;
        this.responses = responses;
    }

    public AttemptResponse getAttempt() {
        return attempt;
    }

    public void setAttempt(AttemptResponse attempt) {
        this.attempt = attempt;
    }

    public List<ResponseResponse> getResponses() {
        return responses;
    }

    public void setResponses(List<ResponseResponse> responses) {
        this.responses = responses;
    }
}
