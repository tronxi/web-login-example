package com.example.weblogincore.infrastructure.persistence.entities.form;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class QuestionEntity {

    @Id
    private Long id;

    private String title;
    private String description;
    private String imageUrl;
    private Boolean isMandatory;
    private String questionType;

    public QuestionEntity(Long id, String title, String description, String imageUrl, Boolean isMandatory, String questionType) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imageUrl = imageUrl;
        this.isMandatory = isMandatory;
        this.questionType = questionType;
    }

    public QuestionEntity() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Boolean getMandatory() {
        return isMandatory;
    }

    public void setMandatory(Boolean mandatory) {
        isMandatory = mandatory;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionEntityType) {
        this.questionType = questionEntityType;
    }
}
