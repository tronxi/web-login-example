package com.example.weblogincore.infrastructure.api.rest.controller;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.FinishedForm;
import com.example.weblogincore.domain.usecases.CreateAttemptUseCase;
import com.example.weblogincore.domain.usecases.FinishAttemptUseCase;
import com.example.weblogincore.domain.usecases.RetrieveFinishedFormsUseCase;
import com.example.weblogincore.infrastructure.api.rest.mapper.AttemptMapper;
import com.example.weblogincore.infrastructure.api.rest.mapper.FinishedFormMapper;
import com.example.weblogincore.infrastructure.api.rest.model.form.AttemptResponse;
import com.example.weblogincore.infrastructure.api.rest.model.form.FinishedFormResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("attempts")
public class AttemptController {

    private final CreateAttemptUseCase createAttemptUseCase;
    private final FinishAttemptUseCase finishAttemptUseCase;
    private final RetrieveFinishedFormsUseCase retrieveFinishedFormsUseCase;
    private final AttemptMapper attemptMapper;
    private final FinishedFormMapper finishedFormMapper;

    public AttemptController(CreateAttemptUseCase createAttemptUseCase, FinishAttemptUseCase finishAttemptUseCase, RetrieveFinishedFormsUseCase retrieveFinishedFormsUseCase, AttemptMapper attemptMapper, FinishedFormMapper finishedFormMapper) {
        this.createAttemptUseCase = createAttemptUseCase;
        this.finishAttemptUseCase = finishAttemptUseCase;
        this.retrieveFinishedFormsUseCase = retrieveFinishedFormsUseCase;
        this.attemptMapper = attemptMapper;
        this.finishedFormMapper = finishedFormMapper;
    }

    @PostMapping("/users/{userId}/forms/{formId}")
    @PreAuthorize("authenticated")
    public ResponseEntity<AttemptResponse> createAttempt(@PathVariable Long formId, @PathVariable Long userId) {
        Attempt attempt = createAttemptUseCase.create(userId, formId);
        return ResponseEntity.ok(attemptMapper.toResponse(attempt));
    }

    @PutMapping("/{id}/finish")
    @PreAuthorize("authenticated")
    public ResponseEntity<AttemptResponse> finishAttempt(@PathVariable Long id) {
        return ResponseEntity.ok(attemptMapper.toResponse(finishAttemptUseCase.finish(id)));
    }

    @GetMapping("/users/{userId}/finished")
    public ResponseEntity<List<FinishedFormResponse>> retrieveFinished(@PathVariable Long userId) {
        List<FinishedForm> finishedForms = retrieveFinishedFormsUseCase.retrieveByUser(userId);
        List<FinishedFormResponse> finishedFormResponses = finishedForms.stream()
                .map(finishedFormMapper::toResponse)
                .collect(Collectors.toList());
        return ResponseEntity.ok(finishedFormResponses);
    }
}
