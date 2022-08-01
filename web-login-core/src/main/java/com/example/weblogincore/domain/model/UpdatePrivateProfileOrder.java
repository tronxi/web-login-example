package com.example.weblogincore.domain.model;

public class UpdatePrivateProfileOrder {
    private Long id;
    private String oldPassword;
    private String newPassword;

    public UpdatePrivateProfileOrder(Long id, String oldPassword, String newPassword) {
        this.id = id;
        this.oldPassword = oldPassword;
        this.newPassword = newPassword;
    }

    public Long getId() {
        return id;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }
}
