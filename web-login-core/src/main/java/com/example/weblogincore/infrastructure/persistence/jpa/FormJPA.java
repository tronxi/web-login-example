package com.example.weblogincore.infrastructure.persistence.jpa;

import com.example.weblogincore.infrastructure.persistence.entities.form.FormEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface FormJPA extends JpaRepository<FormEntity, Long> {
    Optional<FormEntity> findById(Long id);
}
