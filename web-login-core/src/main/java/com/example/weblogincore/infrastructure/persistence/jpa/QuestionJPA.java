package com.example.weblogincore.infrastructure.persistence.jpa;

import com.example.weblogincore.infrastructure.persistence.entities.form.QuestionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface QuestionJPA extends JpaRepository<QuestionEntity, Long> {
    Optional<QuestionEntity> findById(Long id);
}