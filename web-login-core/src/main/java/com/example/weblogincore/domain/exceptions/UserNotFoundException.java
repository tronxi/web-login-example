package com.example.weblogincore.domain.exceptions;

public class UserNotFoundException extends DomainException {

    public UserNotFoundException(Long userId) {
        super("User with id: " + userId + " not found");
    }
}
