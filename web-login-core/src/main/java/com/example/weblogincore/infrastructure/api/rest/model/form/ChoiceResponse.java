package com.example.weblogincore.infrastructure.api.rest.model.form;

public class ChoiceResponse {
    private Long id;
    private String name;
    private QuestionResponse nextQuestion;

    public ChoiceResponse(Long id, String name, QuestionResponse nextQuestion) {
        this.id = id;
        this.name = name;
        this.nextQuestion = nextQuestion;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public QuestionResponse getNextQuestion() {
        return nextQuestion;
    }

    public void setNextQuestion(QuestionResponse nextQuestion) {
        this.nextQuestion = nextQuestion;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
