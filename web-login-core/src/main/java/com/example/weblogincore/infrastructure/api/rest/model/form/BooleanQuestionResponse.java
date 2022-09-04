package com.example.weblogincore.infrastructure.api.rest.model.form;

public class BooleanQuestionResponse extends QuestionResponse{

    private QuestionResponse nextQuestionIfTrue;
    private QuestionResponse nextQuestionIfFalse;

    public BooleanQuestionResponse(Long id, QuestionType questionType, String title, String description, String imageUrl, Boolean isMandatory, QuestionResponse nextQuestionIfTrue, QuestionResponse nextQuestionIfFalse) {
        super(id, questionType, title, description, imageUrl, isMandatory);
        this.nextQuestionIfTrue = nextQuestionIfTrue;
        this.nextQuestionIfFalse = nextQuestionIfFalse;
    }

    public QuestionResponse getNextQuestionIfTrue() {
        return nextQuestionIfTrue;
    }

    public void setNextQuestionIfTrue(QuestionResponse nextQuestionIfTrue) {
        this.nextQuestionIfTrue = nextQuestionIfTrue;
    }

    public QuestionResponse getNextQuestionIfFalse() {
        return nextQuestionIfFalse;
    }

    public void setNextQuestionIfFalse(QuestionResponse nextQuestionIfFalse) {
        this.nextQuestionIfFalse = nextQuestionIfFalse;
    }
}
