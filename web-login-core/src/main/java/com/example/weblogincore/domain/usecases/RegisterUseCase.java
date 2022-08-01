package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.RegisterUserOrder;
import com.example.weblogincore.domain.model.User;
import com.example.weblogincore.domain.persistence.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class RegisterUseCase {

    private final UserRepository userRepository;

    public RegisterUseCase(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User register(RegisterUserOrder registerUserOrder) {
        return userRepository.register(registerUserOrder);
    }
}
