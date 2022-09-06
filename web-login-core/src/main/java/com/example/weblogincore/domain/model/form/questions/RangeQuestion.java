package com.example.weblogincore.domain.model.form.questions;

public class RangeQuestion extends Question{

    private final double startValue;
    private final double endValue;
    private final double initValue;
    private final Question nextQuestion;

    public RangeQuestion(Long id, String title, String description, String imageUrl, Boolean isMandatory, double startValue, double endValue, double initValue, Question nextQuestion) {
        super(id, title, description, imageUrl, isMandatory);
        this.startValue = startValue;
        this.endValue = endValue;
        this.initValue = initValue;
        this.nextQuestion = nextQuestion;
    }

    @Override
    public Integer totalQuestions() {
        if (nextQuestion == null ) return 1;

        return 1 + nextQuestion.totalQuestions();
    }

    public double getStartValue() {
        return startValue;
    }

    public double getEndValue() {
        return endValue;
    }

    public double getInitValue() {
        return initValue;
    }

    public Question getNextQuestion() {
        return nextQuestion;
    }
}
