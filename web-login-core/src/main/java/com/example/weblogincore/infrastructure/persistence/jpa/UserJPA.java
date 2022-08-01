package com.example.weblogincore.infrastructure.persistence.jpa;

import com.example.weblogincore.infrastructure.persistence.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserJPA extends JpaRepository<UserEntity, Long> {
    Optional<UserEntity> findByEmail(String email);
}
