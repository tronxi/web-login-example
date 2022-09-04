package com.example.weblogincore.domain.model.form;

public class Section {
    private final Long id;
    private final String name;
    private final String description;

    private final Question question;

    public Section(Long id, String name, String description, Question question) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.question = question;
    }

    public Integer totalQuestions() {
        return question.totalQuestions();
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public Question getQuestion() {
        return question;
    }
}
