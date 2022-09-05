package com.example.weblogincore.infrastructure.persistence.jpa;

import com.example.weblogincore.domain.model.form.AttemptStatus;
import com.example.weblogincore.infrastructure.persistence.entities.UserEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.AttemptEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AttemptJPA extends JpaRepository<AttemptEntity, Long> {
    List<AttemptEntity> findByUserAndAttemptStatus(UserEntity userEntity, AttemptStatus attemptStatus);
}