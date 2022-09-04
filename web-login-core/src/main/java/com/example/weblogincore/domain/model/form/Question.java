package com.example.weblogincore.domain.model.form;

public abstract class Question {
    private final Long id;
    private final String title;
    private final String description;
    private final String imageUrl;
    private final Boolean isMandatory;

    public Question(Long id, String title, String description, String imageUrl, Boolean isMandatory) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imageUrl = imageUrl;
        this.isMandatory = isMandatory;
    }

    public abstract Integer totalQuestions();

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
}
