package com.example.weblogincore.infrastructure.api.rest.model.form;

import java.util.List;

public class MultipleChoiceQuestionResponse extends QuestionResponse {
    private List<ChoiceResponse> choices;
    private boolean allowMultiple;

    private QuestionResponse defaultQuestion;
    public MultipleChoiceQuestionResponse(Long id, QuestionType questionType, String title, String description, String imageUrl, Boolean isMandatory, List<ChoiceResponse> choices, boolean allowMultiple, QuestionResponse defaultQuestion) {
        super(id, questionType, title, description, imageUrl, isMandatory);
        this.choices = choices;
        this.allowMultiple = allowMultiple;
        this.defaultQuestion = defaultQuestion;
    }

    public List<ChoiceResponse> getChoices() {
        return choices;
    }

    public void setChoices(List<ChoiceResponse> choices) {
        this.choices = choices;
    }

    public boolean isAllowMultiple() {
        return allowMultiple;
    }

    public void setAllowMultiple(boolean allowMultiple) {
        this.allowMultiple = allowMultiple;
    }

    public QuestionResponse getDefaultQuestion() {
        return defaultQuestion;
    }

    public void setDefaultQuestion(QuestionResponse defaultQuestion) {
        this.defaultQuestion = defaultQuestion;
    }
}
