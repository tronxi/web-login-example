package com.example.weblogincore.infrastructure.api.rest.model.form;

public abstract class QuestionResponse {
    private Long id;

    private QuestionType questionType;
    private String title;
    private String description;
    private String imageUrl;
    private Boolean isMandatory;

    public QuestionResponse(Long id, QuestionType questionType, String title, String description, String imageUrl, Boolean isMandatory) {
        this.id = id;
        this.questionType = questionType;
        this.title = title;
        this.description = description;
        this.imageUrl = imageUrl;
        this.isMandatory = isMandatory;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public Boolean getMandatory() {
        return isMandatory;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setMandatory(Boolean mandatory) {
        isMandatory = mandatory;
    }

    public QuestionType getQuestionType() {
        return questionType;
    }

    public void setQuestionType(QuestionType questionType) {
        this.questionType = questionType;
    }
}
