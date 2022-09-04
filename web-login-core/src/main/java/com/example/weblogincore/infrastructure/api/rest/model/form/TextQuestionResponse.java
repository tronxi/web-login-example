package com.example.weblogincore.infrastructure.api.rest.model.form;

public class TextQuestionResponse extends QuestionResponse{
    private QuestionResponse nextQuestion;

    public TextQuestionResponse(Long id, QuestionType questionType, String title, String description, String imageUrl, Boolean isMandatory, QuestionResponse nextQuestion) {
        super(id, questionType, title, description, imageUrl, isMandatory);
        this.nextQuestion = nextQuestion;
    }

    public QuestionResponse getNextQuestion() {
        return nextQuestion;
    }

    public void setNextQuestion(QuestionResponse nextQuestion) {
        this.nextQuestion = nextQuestion;
    }
}
