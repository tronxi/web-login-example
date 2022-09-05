package com.example.weblogincore.domain.services;

import com.example.weblogincore.domain.model.form.*;
import com.example.weblogincore.domain.persistence.FormRepository;
import org.springframework.stereotype.Service;

@Service
public class FormRetriever {
    private final FormRepository formRepository;

    public FormRetriever(FormRepository formRepository) {
        this.formRepository = formRepository;
    }

    public Form retrieve() {
        return formRepository.findForm()
                .orElseThrow(RuntimeException::new);
    }
}
