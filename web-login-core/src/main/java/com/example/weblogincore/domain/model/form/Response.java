package com.example.weblogincore.domain.model.form;

import com.example.weblogincore.domain.model.form.questions.Question;

public class Response {
    private final Attempt attempt;
    private final Question question;
    private final String response;

    public Response(Attempt attempt, Question question, String response) {
        this.attempt = attempt;
        this.question = question;
        this.response = response;
    }

    public Attempt getAttempt() {
        return attempt;
    }

    public Question getQuestion() {
        return question;
    }

    public String getResponse() {
        return response;
    }

}
