package com.example.weblogincore.domain.model.form.questions;

public class Choice {
    private final Long id;
    private final String name;
    private final Question nextQuestion;

    public Choice(Long id, String name, Question nextQuestion) {
        this.id = id;
        this.name = name;
        this.nextQuestion = nextQuestion;
    }

    public String getName() {
        return name;
    }

    public Question getNextQuestion() {
        return nextQuestion;
    }

    public Long getId() {
        return id;
    }
}
