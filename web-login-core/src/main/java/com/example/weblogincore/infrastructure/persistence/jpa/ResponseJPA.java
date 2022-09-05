package com.example.weblogincore.infrastructure.persistence.jpa;

import com.example.weblogincore.infrastructure.persistence.entities.form.AttemptEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.QuestionEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.ResponseEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ResponseJPA extends JpaRepository<ResponseEntity, Long> {
    Optional<ResponseEntity> findById(Long id);
    List<ResponseEntity> findByAttemptEntityAndQuestionEntity(AttemptEntity attemptEntity, QuestionEntity questionEntity);

    List<ResponseEntity> findByAttemptEntity(AttemptEntity attemptEntity);
}
