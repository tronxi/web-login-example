package com.example.weblogincore.infrastructure.api.rest.controller;

import com.example.weblogincore.domain.model.form.DeleteResponseOrder;
import com.example.weblogincore.domain.model.form.ResponseOrder;
import com.example.weblogincore.domain.usecases.DeleteResponseUseCase;
import com.example.weblogincore.domain.usecases.MarkResponseUseCase;
import com.example.weblogincore.infrastructure.api.rest.model.form.ResponseRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("responses")
public class ResponseController {
    private final MarkResponseUseCase markResponseUseCase;
    private final DeleteResponseUseCase deleteResponseUseCase;

    public ResponseController(MarkResponseUseCase markResponseUseCase, DeleteResponseUseCase deleteResponseUseCase) {
        this.markResponseUseCase = markResponseUseCase;
        this.deleteResponseUseCase = deleteResponseUseCase;
    }

    @PostMapping("/attempts/{attemptId}/questions/{questionId}")
    @PreAuthorize("authenticated")
    public ResponseEntity<Void> markResponse(@PathVariable Long attemptId,
                                             @PathVariable Long questionId,
                                             @RequestBody ResponseRequest responseRequest) {
        ResponseOrder responseOrder = new ResponseOrder(questionId, attemptId, responseRequest.getResponse());
        markResponseUseCase.mark(responseOrder);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/attempts/{attemptId}/questions/{questionId}")
    @PreAuthorize("authenticated")
    public ResponseEntity<Void> deleteResponse(@PathVariable Long attemptId,
                                             @PathVariable Long questionId) {
        DeleteResponseOrder deleteResponseOrder = new DeleteResponseOrder(questionId, attemptId);
        deleteResponseUseCase.delete(deleteResponseOrder);
        return ResponseEntity.ok().build();
    }
}
