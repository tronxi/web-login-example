package com.example.weblogincore.domain.persistence;

import com.example.weblogincore.domain.model.RegisterUserOrder;
import com.example.weblogincore.domain.model.User;

import java.util.Optional;

public interface UserRepository {
    Optional<User> findByEmail(String email);
    Optional<User> findById(Long id);
    User register(RegisterUserOrder registerUserOrder);
    User update(User user);
    User modifyPassword(User user, String password);
    Optional<String> findEncryptedPasswordById(Long id);
}
