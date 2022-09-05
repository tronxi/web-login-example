package com.example.weblogincore.domain.services;

import com.example.weblogincore.domain.exceptions.UserNotFoundException;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.persistence.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserRetriever {
    private final UserRepository userRepository;

    public UserRetriever(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException(id));
    }
}
