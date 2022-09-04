package com.example.weblogincore.domain.model.form;

import java.util.List;

public class MultipleChoiceQuestion extends Question {

    private final List<Choice> choices;
    private final boolean allowMultiple;
    private final Question defaultQuestion;

    public MultipleChoiceQuestion(Long id, String title, String description, String imageUrl, Boolean isMandatory, List<Choice> choices, boolean allowMultiple, Question defaultQuestion) {
        super(id, title, description, imageUrl, isMandatory);
        this.choices = choices;
        this.allowMultiple = allowMultiple;
        this.defaultQuestion = defaultQuestion;
    }

    @Override
    public Integer totalQuestions() {
        int total = 1;
        total += choices.stream()
                .filter(choice -> choice.getNextQuestion() != null)
                .map(choice -> choice.getNextQuestion().totalQuestions())
                .reduce(Integer::sum)
                .orElse(0);
        if(defaultQuestion != null){
            total += defaultQuestion.totalQuestions();
        }
        return total;
    }

    public List<Choice> getChoices() {
        return choices;
    }

    public boolean isAllowMultiple() {
        return allowMultiple;
    }

    public Question getDefaultQuestion() {
        return defaultQuestion;
    }
}
