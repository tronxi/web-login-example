package com.example.weblogincore.infrastructure.api.rest.model.form;

public class ResponseResponse {
    private Long id;

    private QuestionType questionType;
    private String title;
    private String description;
    private String response;


    public ResponseResponse(Long id, QuestionType questionType, String title, String description, String response) {
        this.id = id;
        this.questionType = questionType;
        this.title = title;
        this.description = description;
        this.response = response;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public QuestionType getQuestionType() {
        return questionType;
    }

    public void setQuestionType(QuestionType questionType) {
        this.questionType = questionType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }
}
