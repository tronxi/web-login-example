package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.form.*;
import com.example.weblogincore.domain.persistence.FormRepository;
import org.springframework.stereotype.Service;

@Service
public class RetrieveFormUseCase {
    private final FormRepository formRepository;

    public RetrieveFormUseCase(FormRepository formRepository) {
        this.formRepository = formRepository;
    }

    public Form retrieve() {
        return formRepository.findForm()
                .orElseThrow(RuntimeException::new);
    }
}
