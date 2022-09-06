package com.example.weblogincore.infrastructure.api.rest.model.form;

public class RangeQuestionResponse extends QuestionResponse{

    private double startValue;
    private double endValue;
    private double initValue;
    private QuestionResponse nextQuestion;

    public RangeQuestionResponse(Long id, QuestionType questionType, String title, String description, String imageUrl, Boolean isMandatory, double startValue, double endValue, double initValue, QuestionResponse nextQuestion) {
        super(id, questionType, title, description, imageUrl, isMandatory);
        this.startValue = startValue;
        this.endValue = endValue;
        this.initValue = initValue;
        this.nextQuestion = nextQuestion;
    }

    public double getStartValue() {
        return startValue;
    }

    public void setStartValue(double startValue) {
        this.startValue = startValue;
    }

    public double getEndValue() {
        return endValue;
    }

    public void setEndValue(double endValue) {
        this.endValue = endValue;
    }

    public double getInitValue() {
        return initValue;
    }

    public void setInitValue(double initValue) {
        this.initValue = initValue;
    }

    public QuestionResponse getNextQuestion() {
        return nextQuestion;
    }

    public void setNextQuestion(QuestionResponse nextQuestion) {
        this.nextQuestion = nextQuestion;
    }
}
