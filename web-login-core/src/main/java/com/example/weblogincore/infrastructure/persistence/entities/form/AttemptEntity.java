package com.example.weblogincore.infrastructure.persistence.entities.form;

import com.example.weblogincore.domain.model.form.AttemptStatus;
import com.example.weblogincore.infrastructure.persistence.entities.UserEntity;

import javax.persistence.*;

@Entity
public class AttemptEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(fetch = FetchType.EAGER)
    private UserEntity user;

    @OneToOne(fetch = FetchType.EAGER)
    private FormEntity form;

    private AttemptStatus attemptStatus;

    public AttemptEntity(UserEntity user, FormEntity form, AttemptStatus attemptStatus) {
        this.user = user;
        this.form = form;
        this.attemptStatus = attemptStatus;
    }

    public AttemptEntity() {

    }

    public AttemptEntity(Long id, UserEntity user, FormEntity form, AttemptStatus attemptStatus) {
        this.id = id;
        this.user = user;
        this.form = form;
        this.attemptStatus = attemptStatus;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public FormEntity getForm() {
        return form;
    }

    public void setForm(FormEntity form) {
        this.form = form;
    }

    public AttemptStatus getAttemptStatus() {
        return attemptStatus;
    }

    public void setAttemptStatus(AttemptStatus attemptStatus) {
        this.attemptStatus = attemptStatus;
    }
}
