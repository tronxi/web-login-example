package com.example.weblogincore.domain.model.user;

public class RegisterUserOrder {
    private String email;
    private String name;
    private String surname;
    private String password;

    public RegisterUserOrder(String email, String name, String surname, String password) {
        this.email = email;
        this.name = name;
        this.surname = surname;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getPassword() {
        return password;
    }
}
