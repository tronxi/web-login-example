package com.example.weblogincore.domain.model.form.questions;

public class TextQuestion extends Question {

    private final Question nextQuestion;

    public TextQuestion(Long id, String title, String description, String imageUrl, Boolean isMandatory, Question nextQuestion) {
        super(id, title, description, imageUrl, isMandatory);
        this.nextQuestion = nextQuestion;
    }

    public Question getNextQuestion() {
        return nextQuestion;
    }

    @Override
    public Integer totalQuestions() {
        if (nextQuestion == null ) return 1;

        return 1 + nextQuestion.totalQuestions();
    }
}
