package com.example.weblogincore.infrastructure.persistence.adapter;

import com.example.weblogincore.domain.model.form.Form;
import com.example.weblogincore.domain.persistence.FormRepository;
import com.example.weblogincore.infrastructure.persistence.jpa.FormJPA;
import com.example.weblogincore.infrastructure.persistence.mapper.FormEntityMapper;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class FormRepositoryMysql implements FormRepository {
    private final FormJPA formJPA;
    private final FormEntityMapper formEntityMapper;

    public FormRepositoryMysql(FormJPA formJPA, FormEntityMapper formEntityMapper) {
        this.formJPA = formJPA;
        this.formEntityMapper = formEntityMapper;
    }

    @Override
    public Optional<Form> findForm() {
        return formJPA.findById(0L)
                .map(formEntityMapper::toDomain);
    }
}
