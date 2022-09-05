package com.example.weblogincore.infrastructure.api.rest.model.form;

public class AttemptResponse {
    private Long id;
    private Long userId;
    private Long formId;

    public AttemptResponse(Long id, Long userId, Long formId) {
        this.id = id;
        this.userId = userId;
        this.formId = formId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getFormId() {
        return formId;
    }

    public void setFormId(Long formId) {
        this.formId = formId;
    }
}
