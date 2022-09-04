package com.example.weblogincore.infrastructure.persistence.entities.form;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

@Entity
public class TextQuestionEntity extends QuestionEntity {
    @OneToOne(fetch = FetchType.EAGER)
    private QuestionEntity nextQuestion;

    public TextQuestionEntity(Long id, String title, String description, String imageUrl, Boolean isMandatory, String questionEntityType, QuestionEntity nextQuestion) {
        super(id, title, description, imageUrl, isMandatory, questionEntityType);
        this.nextQuestion = nextQuestion;
    }

    public TextQuestionEntity(QuestionEntity nextQuestion) {
        this.nextQuestion = nextQuestion;
    }

    public TextQuestionEntity() {
    }

    public QuestionEntity getNextQuestion() {
        return nextQuestion;
    }

    public void setNextQuestion(QuestionEntity nextQuestion) {
        this.nextQuestion = nextQuestion;
    }
}
