package com.example.weblogincore.domain.model.form;

import com.example.weblogincore.domain.model.user.User;

public class CreateAttempt {
    private final User user;
    private final Form form;
    private final AttemptStatus attemptStatus;

    public CreateAttempt(User user, Form form, AttemptStatus attemptStatus) {
        this.user = user;
        this.form = form;
        this.attemptStatus = attemptStatus;
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
