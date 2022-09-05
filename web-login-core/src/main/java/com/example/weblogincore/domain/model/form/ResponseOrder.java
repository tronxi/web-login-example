package com.example.weblogincore.domain.model.form;

public class ResponseOrder {
    private final Long questionId;
    private final Long attemptId;
    private final String response;

    public ResponseOrder(Long questionId, Long attemptId, String response) {
        this.questionId = questionId;
        this.attemptId = attemptId;
        this.response = response;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public Long getAttemptId() {
        return attemptId;
    }

    public String getResponse() {
        return response;
    }
}
