package com.example.weblogincore.domain.model.form;

import com.example.weblogincore.domain.model.user.User;

public class Attempt {
    private final Long id;
    private final User user;
    private final Form form;
    private final AttemptStatus attemptStatus;

    public Attempt(Long id, User user, Form form, AttemptStatus attemptStatus) {
        this.id = id;
        this.user = user;
        this.form = form;
        this.attemptStatus = attemptStatus;
    }
    public Long getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public Form getForm() {
        return form;
    }

    public AttemptStatus getAttemptStatus() {
        return attemptStatus;
    }
}
