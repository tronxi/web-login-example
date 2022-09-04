package com.example.weblogincore.infrastructure.persistence.entities.form;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class ChoiceEntity {

    @Id
    private Long id;

    private String name;

    @OneToOne(fetch = FetchType.EAGER)
    private QuestionEntity nextQuestion;

    public ChoiceEntity(Long id, String name, QuestionEntity nextQuestion) {
        this.id = id;
        this.name = name;
        this.nextQuestion = nextQuestion;
    }

    public ChoiceEntity() {

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

    public QuestionEntity getNextQuestion() {
        return nextQuestion;
    }

    public void setNextQuestion(QuestionEntity nextQuestion) {
        this.nextQuestion = nextQuestion;
    }
}
