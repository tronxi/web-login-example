package com.example.weblogincore.infrastructure.persistence.mapper;

import com.example.weblogincore.domain.model.form.*;
import com.example.weblogincore.infrastructure.persistence.entities.form.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class FormEntityMapper {

    public Form toDomain(FormEntity formEntity) {
        List<Section> sections = formEntity.getSections().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
        return new Form(formEntity.getId(), formEntity.getName(), formEntity.getDescription(), sections);
    }

    Section toDomain(SectionEntity sectionEntity) {
        Question question = toDomain(sectionEntity.getQuestion());
        return new Section(sectionEntity.getId(), sectionEntity.getName(), sectionEntity.getDescription(), question);
    }

    Question toDomain(QuestionEntity questionEntity) {
        if(questionEntity == null) return null;

        switch (questionEntity.getQuestionType()) {
            case "TEXT_TYPE":
                return toDomainTextQuestion((TextQuestionEntity) questionEntity);
            case "BOOL_TYPE":
                return toDomainBoolQuestion((BoolQuestionEntity) questionEntity);
            case "MULTIPLE_TYPE":
                return toDomainMultipleChoiceQuestion((MultipleChoiceQuestionEntity) questionEntity);
        }
        return null;
    }

    Question toDomainTextQuestion(TextQuestionEntity textQuestionEntity) {
        Question nextQuestion = toDomain(textQuestionEntity.getNextQuestion());
        return new TextQuestion(textQuestionEntity.getId(), textQuestionEntity.getTitle(),
                textQuestionEntity.getDescription(), textQuestionEntity.getImageUrl(), textQuestionEntity.getMandatory(), nextQuestion);
    }

    Question toDomainBoolQuestion(BoolQuestionEntity boolQuestionEntity) {
        Question nextQuestionIfTrue = toDomain(boolQuestionEntity.getNextIfTrue());
        Question nextQuestionIfFalse = toDomain(boolQuestionEntity.getNextIfFalse());

        return new BooleanQuestion(boolQuestionEntity.getId(), boolQuestionEntity.getTitle(),
                boolQuestionEntity.getDescription(), boolQuestionEntity.getImageUrl(), boolQuestionEntity.getMandatory(), nextQuestionIfTrue, nextQuestionIfFalse);
    }

    Question toDomainMultipleChoiceQuestion(MultipleChoiceQuestionEntity multipleChoiceQuestionEntity) {
        List<Choice> choices = multipleChoiceQuestionEntity.getChoiceEntityList().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
        Question defaultQuestion = toDomain(multipleChoiceQuestionEntity.getDefaultQuestion());

        return new MultipleChoiceQuestion(multipleChoiceQuestionEntity.getId(), multipleChoiceQuestionEntity.getTitle(),
                multipleChoiceQuestionEntity.getDescription(), multipleChoiceQuestionEntity.getImageUrl(), multipleChoiceQuestionEntity.getMandatory(), choices, multipleChoiceQuestionEntity.isAllowMultiple(), defaultQuestion);
    }

    Choice toDomain(ChoiceEntity choiceEntity) {
        Question nextQuestion = toDomain(choiceEntity.getNextQuestion());
        return new Choice(choiceEntity.getId(), choiceEntity.getName(), nextQuestion);
    }
}
