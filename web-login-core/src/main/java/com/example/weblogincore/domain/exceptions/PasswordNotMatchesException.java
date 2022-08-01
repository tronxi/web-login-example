package com.example.weblogincore.domain.exceptions;

public class PasswordNotMatchesException extends DomainException {

    public PasswordNotMatchesException() {
        super("Password are not equal");
    }
}
