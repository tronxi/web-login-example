package com.example.weblogincore.domain.model.form;

import java.util.List;

public class FinishedForm {
    private final Form form;
    private final List<Response> responses;

    public FinishedForm(Form form, List<Response> responses) {
        this.form = form;
        this.responses = responses;
    }

    public Form getForm() {
        return form;
    }

    public List<Response> getResponses() {
        return responses;
    }
}
