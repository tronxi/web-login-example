package com.example.weblogincore.infrastructure.api.rest.model.form;

public class SectionResponse {
    private Long id;
    private String name;
    private String description;
    private QuestionResponse questionResponse;
    private Integer totalQuestions;

    public SectionResponse(Long id, String name, String description, QuestionResponse questionResponse, Integer totalQuestions) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.questionResponse = questionResponse;
        this.totalQuestions = totalQuestions;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public QuestionResponse getQuestionResponse() {
        return questionResponse;
    }

    public void setQuestionResponse(QuestionResponse questionResponse) {
        this.questionResponse = questionResponse;
    }

    public Integer getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(Integer totalQuestions) {
        this.totalQuestions = totalQuestions;
    }
}
