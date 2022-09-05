package com.example.weblogincore.infrastructure.persistence.entities.form;

import javax.persistence.*;

@Entity
public class ResponseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(fetch = FetchType.EAGER)
    private AttemptEntity attemptEntity;

    @OneToOne(fetch = FetchType.EAGER)
    private QuestionEntity questionEntity;

    private String response;

    public ResponseEntity(AttemptEntity attemptEntity, QuestionEntity questionEntity, String response) {
        this.attemptEntity = attemptEntity;
        this.questionEntity = questionEntity;
        this.response = response;
    }

    public ResponseEntity() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public AttemptEntity getAttemptEntity() {
        return attemptEntity;
    }

    public void setAttemptEntity(AttemptEntity attemptEntity) {
        this.attemptEntity = attemptEntity;
    }

    public QuestionEntity getQuestionEntity() {
        return questionEntity;
    }

    public void setQuestionEntity(QuestionEntity questionEntity) {
        this.questionEntity = questionEntity;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }
}
