package com.example.weblogincore.infrastructure.persistence.entities.form;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

@Entity
public class BoolQuestionEntity extends QuestionEntity {
    @OneToOne(fetch = FetchType.EAGER)
    private QuestionEntity nextIfTrue;
    @OneToOne(fetch = FetchType.EAGER)
    private QuestionEntity nextIfFalse;

    public BoolQuestionEntity(Long id, String title, String description, String imageUrl, Boolean isMandatory, String questionEntityType, QuestionEntity nextIfTrue, QuestionEntity nextIfFalse) {
        super(id, title, description, imageUrl, isMandatory, questionEntityType);
        this.nextIfTrue = nextIfTrue;
        this.nextIfFalse = nextIfFalse;
    }

    public BoolQuestionEntity(QuestionEntity nextIfTrue, QuestionEntity nextIfFalse) {
        this.nextIfTrue = nextIfTrue;
        this.nextIfFalse = nextIfFalse;
    }

    public BoolQuestionEntity() {}

    public QuestionEntity getNextIfTrue() {
        return nextIfTrue;
    }

    public void setNextIfTrue(QuestionEntity nextIfTrue) {
        this.nextIfTrue = nextIfTrue;
    }

    public QuestionEntity getNextIfFalse() {
        return nextIfFalse;
    }

    public void setNextIfFalse(QuestionEntity nextIfFalse) {
        this.nextIfFalse = nextIfFalse;
    }
}
