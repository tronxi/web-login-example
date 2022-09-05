package com.example.weblogincore.infrastructure.api.rest.model.form;

public class FinishedFormResponse {
    private Long formId;
    private String formName;
    private String formDescription;
    private FinishedAttemptResponse finishedAttempts;

    public FinishedFormResponse(Long formId, String formName, String formDescription, FinishedAttemptResponse finishedAttempts) {
        this.formId = formId;
        this.formName = formName;
        this.formDescription = formDescription;
        this.finishedAttempts = finishedAttempts;
    }

    public Long getFormId() {
        return formId;
    }

    public void setFormId(Long formId) {
        this.formId = formId;
    }

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public String getFormDescription() {
        return formDescription;
    }

    public void setFormDescription(String formDescription) {
        this.formDescription = formDescription;
    }

    public FinishedAttemptResponse getFinishedAttempts() {
        return finishedAttempts;
    }

    public void setFinishedAttempts(FinishedAttemptResponse finishedAttempts) {
        this.finishedAttempts = finishedAttempts;
    }
}
