package com.example.weblogincore.infrastructure.persistence.entities.form;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import java.util.List;

@Entity
public class MultipleChoiceQuestionEntity extends QuestionEntity {

    @ManyToMany(fetch = FetchType.EAGER)
    private List<ChoiceEntity> choiceEntityList;

    @OneToOne(fetch = FetchType.EAGER)
    private QuestionEntity defaultQuestion;

    private boolean allowMultiple;

    public MultipleChoiceQuestionEntity(Long id, String title, String description, String imageUrl, Boolean isMandatory, String questionType, List<ChoiceEntity> choiceEntityList, QuestionEntity defaultQuestion, boolean allowMultiple) {
        super(id, title, description, imageUrl, isMandatory, questionType);
        this.choiceEntityList = choiceEntityList;
        this.defaultQuestion = defaultQuestion;
        this.allowMultiple = allowMultiple;
    }

    public MultipleChoiceQuestionEntity(List<ChoiceEntity> choiceEntityList, QuestionEntity defaultQuestion, boolean allowMultiple) {
        this.choiceEntityList = choiceEntityList;
        this.defaultQuestion = defaultQuestion;
        this.allowMultiple = allowMultiple;
    }

    public MultipleChoiceQuestionEntity() {

    }

    public List<ChoiceEntity> getChoiceEntityList() {
        return choiceEntityList;
    }

    public void setChoiceEntityList(List<ChoiceEntity> choiceEntityList) {
        this.choiceEntityList = choiceEntityList;
    }

    public boolean isAllowMultiple() {
        return allowMultiple;
    }

    public void setAllowMultiple(boolean allowMultiple) {
        this.allowMultiple = allowMultiple;
    }

    public QuestionEntity getDefaultQuestion() {
        return defaultQuestion;
    }

    public void setDefaultQuestion(QuestionEntity defaultQuestion) {
        this.defaultQuestion = defaultQuestion;
    }
}
