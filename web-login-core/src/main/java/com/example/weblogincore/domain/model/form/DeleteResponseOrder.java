package com.example.weblogincore.domain.model.form;

public class DeleteResponseOrder {
    private final Long questionId;
    private final Long attemptId;

    public DeleteResponseOrder(Long questionId, Long attemptId) {
        this.questionId = questionId;
        this.attemptId = attemptId;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public Long getAttemptId() {
        return attemptId;
    }
}
