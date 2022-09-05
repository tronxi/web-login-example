package com.example.weblogincore.infrastructure.api.rest.controller;

import com.example.weblogincore.domain.services.FormRetriever;
import com.example.weblogincore.infrastructure.api.rest.mapper.FormMapper;
import com.example.weblogincore.infrastructure.api.rest.model.form.FormResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("forms")
public class FormController {

    private final FormRetriever formRetriever;
    private final FormMapper formMapper;

    public FormController(FormRetriever formRetriever, FormMapper formMapper) {
        this.formRetriever = formRetriever;
        this.formMapper = formMapper;
    }

    @GetMapping
    @PreAuthorize("authenticated")
    public ResponseEntity<FormResponse> retrieveForm() {
        return ResponseEntity.ok(formMapper.toResponse(formRetriever.retrieve()));
    }
}
