package com.example.weblogincore.infrastructure.api.rest.mapper;

import com.example.weblogincore.domain.model.form.*;
import com.example.weblogincore.infrastructure.api.rest.model.form.*;
import com.example.weblogincore.infrastructure.api.rest.model.form.MultipleChoiceQuestionResponse;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class FormMapper {

    public FormResponse toResponse(Form form){
        List<SectionResponse> sectionResponses = form.getSections().stream()
                .map(this::toResponse)
                .collect(Collectors.toList());

        return new FormResponse(form.getId(), form.getName(), form.getDescription(), sectionResponses,form.totalSections(), form.totalQuestions());
    }

    private SectionResponse toResponse(Section section) {
        return new SectionResponse(section.getId(),
                                section.getName(),
                                section.getDescription(),
                                toResponseJuja(section.getQuestion()),
                                section.totalQuestions());
    }

    private TextQuestionResponse toResponse(TextQuestion textQuestion) {
        QuestionResponse next = null;
        if(textQuestion.getNextQuestion() != null) {
            next = toResponseJuja(textQuestion.getNextQuestion());
        }
        return new TextQuestionResponse(textQuestion.getId(),QuestionType.TEXT_TYPE,
                textQuestion.getTitle(), textQuestion.getDescription(),
                textQuestion.getImageUrl(), textQuestion.getMandatory(), next);
    }

    private BooleanQuestionResponse toResponse(BooleanQuestion booleanQuestion) {
        QuestionResponse nextIfTrue = null;
        if(booleanQuestion.getNextIfTrue() != null) {
            nextIfTrue = toResponseJuja(booleanQuestion.getNextIfTrue());
        }
        QuestionResponse nextIfFalse = null;
        if(booleanQuestion.getNextIfFalse() != null) {
            nextIfFalse = toResponseJuja(booleanQuestion.getNextIfFalse());
        }
        return new BooleanQuestionResponse(booleanQuestion.getId(),QuestionType.BOOLEAN_TYPE,
                booleanQuestion.getTitle(), booleanQuestion.getDescription(),
                booleanQuestion.getImageUrl(), booleanQuestion.getMandatory(), nextIfTrue, nextIfFalse);
    }

    private MultipleChoiceQuestionResponse toResponse(MultipleChoiceQuestion multipleChoiceQuestion) {
        List<ChoiceResponse> choices = multipleChoiceQuestion.getChoices().stream()
                .map(this::toResponse)
                .collect(Collectors.toList());
        QuestionResponse defaultQuestion = null;
        if(multipleChoiceQuestion.getDefaultQuestion() != null) {
            defaultQuestion = toResponseJuja(multipleChoiceQuestion.getDefaultQuestion());
        }

        return new MultipleChoiceQuestionResponse(multipleChoiceQuestion.getId(), QuestionType.MULTIPLE_TYPE,
                multipleChoiceQuestion.getTitle(), multipleChoiceQuestion.getDescription(), multipleChoiceQuestion.getImageUrl(), multipleChoiceQuestion.getMandatory(),
                choices, multipleChoiceQuestion.isAllowMultiple(), defaultQuestion);
    }

    private ChoiceResponse toResponse(Choice choice) {
        QuestionResponse nextQuestion = null;
        if(choice.getNextQuestion() != null) {
            nextQuestion = toResponseJuja(choice.getNextQuestion());
        }
        return new ChoiceResponse(choice.getId(), choice.getName(), nextQuestion);
    }

    private QuestionResponse toResponseJuja(Question question) {
        if (question instanceof TextQuestion) return toResponse((TextQuestion) question);
        if (question instanceof BooleanQuestion) return toResponse((BooleanQuestion) question);
        if (question instanceof MultipleChoiceQuestion) return toResponse((MultipleChoiceQuestion) question);

        return null;
    }

}
