package com.example.weblogincore.domain.model.form;

public class BooleanQuestion extends Question{
    private final Question nextIfTrue;
    private final Question nextIfFalse;

    public BooleanQuestion(Long id, String title, String description, String imageUrl, Boolean isMandatory, Question nextIfTrue, Question nextIfFalse) {
        super(id, title, description, imageUrl, isMandatory);
        this.nextIfTrue = nextIfTrue;
        this.nextIfFalse = nextIfFalse;
    }

    @Override
    public Integer totalQuestions() {
        Integer total = 1;
        if(nextIfFalse != null) total += nextIfFalse.totalQuestions();
        if(nextIfTrue != null) total += nextIfTrue.totalQuestions();
        return total;
    }

    public Question getNextIfTrue() {
        return nextIfTrue;
    }

    public Question getNextIfFalse() {
        return nextIfFalse;
    }
}
