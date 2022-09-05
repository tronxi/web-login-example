package com.example.weblogincore.infrastructure.api.rest.mapper;

import com.example.weblogincore.domain.model.form.FinishedForm;
import com.example.weblogincore.domain.model.form.Response;
import com.example.weblogincore.infrastructure.api.rest.model.form.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class FinishedFormMapper {

    private final FormMapper formMapper;
    private final AttemptMapper attemptMapper;

    public FinishedFormMapper(FormMapper formMapper, AttemptMapper attemptMapper) {
        this.formMapper = formMapper;
        this.attemptMapper = attemptMapper;
    }

    public FinishedFormResponse toResponse(FinishedForm finishedForm) {
        AttemptResponse attemptResponse = attemptMapper.toResponse(finishedForm.getResponses().get(0).getAttempt());
        List<ResponseResponse> responses = finishedForm.getResponses().stream()
                .map(this::toResponse)
                .collect(Collectors.toList());
        FinishedAttemptResponse finishedAttemptResponse = new FinishedAttemptResponse(attemptResponse, responses);

        return new FinishedFormResponse(finishedForm.getForm().getId(), finishedForm.getForm().getName(), finishedForm.getForm().getDescription(), finishedAttemptResponse);

    }

    private ResponseResponse toResponse(Response response) {
        QuestionResponse questionResponse = formMapper.toResponse(response.getQuestion());
        return new ResponseResponse(questionResponse.getId(),questionResponse.getQuestionType(), questionResponse.getTitle(), questionResponse.getDescription(), response.getResponse());
    }
}
