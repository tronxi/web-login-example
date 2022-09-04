package com.example.weblogincore.infrastructure.persistence.entities.form;

import javax.persistence.*;

@Entity
public class SectionEntity {

    @Id
    private Long id;
    private String name;
    private String description;

    @ManyToOne(fetch = FetchType.EAGER)
    private QuestionEntity question;

    public SectionEntity(Long id, String name, String description, QuestionEntity question) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.question = question;
    }

    public SectionEntity() {}

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

    public QuestionEntity getQuestion() {
        return question;
    }

    public void setQuestion(QuestionEntity question) {
        this.question = question;
    }
}
