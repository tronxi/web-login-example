package com.example.weblogincore.infrastructure.persistence.entities.form;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

@Entity
public class RangeQuestionEntity extends QuestionEntity {

    private double startValue;
    private double endValue;
    private double initValue;

    @OneToOne(fetch = FetchType.EAGER)
    private QuestionEntity nextQuestion;

    public RangeQuestionEntity(Long id, String title, String description, String imageUrl, Boolean isMandatory, String questionEntityType, double startValue, double endValue, double initValue, QuestionEntity nextQuestion) {
        super(id, title, description, imageUrl, isMandatory, questionEntityType);
        this.startValue = startValue;
        this.endValue = endValue;
        this.initValue = initValue;
        this.nextQuestion = nextQuestion;
    }

    public RangeQuestionEntity() {

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

    public QuestionEntity getNextQuestion() {
        return nextQuestion;
    }

    public void setNextQuestion(QuestionEntity nextQuestion) {
        this.nextQuestion = nextQuestion;
    }
}
