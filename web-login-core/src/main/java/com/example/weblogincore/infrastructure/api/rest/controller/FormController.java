package com.example.weblogincore.infrastructure.api.rest.controller;

import com.example.weblogincore.domain.usecases.RetrieveFormUseCase;
import com.example.weblogincore.infrastructure.api.rest.mapper.FormMapper;
import com.example.weblogincore.infrastructure.api.rest.model.form.FormResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("forms")
public class FormController {

    private final RetrieveFormUseCase retrieveFormUseCase;
    private final FormMapper formMapper;

    public FormController(RetrieveFormUseCase retrieveFormUseCase, FormMapper formMapper) {
        this.retrieveFormUseCase = retrieveFormUseCase;
        this.formMapper = formMapper;
    }

    @GetMapping
    public ResponseEntity<FormResponse> retrieveForm() {
        return ResponseEntity.ok(formMapper.toResponse(retrieveFormUseCase.retrieve()));
    }
}
