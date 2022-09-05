package com.example.weblogincore.infrastructure.api.rest.mapper;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.infrastructure.api.rest.model.form.AttemptResponse;
import org.springframework.stereotype.Component;

@Component
public class AttemptMapper {
    public AttemptResponse toResponse(Attempt attempt) {
        return new AttemptResponse(attempt.getId(), attempt.getUser().getId(), attempt.getForm().getId());
    }
}
