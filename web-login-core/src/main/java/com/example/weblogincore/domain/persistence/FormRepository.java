package com.example.weblogincore.domain.persistence;

import com.example.weblogincore.domain.model.form.Form;

import java.util.Optional;

public interface FormRepository {
    Optional<Form> findForm();
}
