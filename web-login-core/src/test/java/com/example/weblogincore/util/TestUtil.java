package com.example.weblogincore.util;

import com.example.weblogincore.domain.model.RegisterUserOrder;
import com.example.weblogincore.domain.model.UpdatePrivateProfileOrder;
import com.example.weblogincore.domain.model.UpdatePublicProfileOrder;
import com.example.weblogincore.domain.model.User;

public class TestUtil {
    public static Long ID = 5L;
    public static Long INCORRECT_ID = 6L;

    public static User getUser() {
        return new User(ID, "sergio@gmail.com", "sergio", "garcia", "$2a$10$DznBdrXxTTHTcFtZGEZwmuLv1oTKhVbM.QNfu6MwU9zN9arXKJV5u");
    }

    public static User getUpdatedUser() {
        return new User(ID, "sergio97@gmail.com", "sergio97", "garcia sanchez", "$2a$10$DznBdrXxTTHTcFtZGEZwmuLv1oTKhVbM.QNfu6MwU9zN9arXKJV5u");
    }

    public static UpdatePublicProfileOrder getUpdatePublicProfileOrder() {
        return new UpdatePublicProfileOrder(ID, "sergio97@gmail.com", "sergio97", "garcia sanchez");
    }

    public static UpdatePrivateProfileOrder getUpdatePrivateProfileOrderCorrect() {
        return new UpdatePrivateProfileOrder(ID, "1234", "12345");
    }

    public static UpdatePrivateProfileOrder getUpdatePrivateProfileOrderIncorrect() {
        return new UpdatePrivateProfileOrder(ID, "12345", "12345");
    }

    public static RegisterUserOrder getRegisterUserOrder() {
        return new RegisterUserOrder("sergio@gmail.com", "sergio", "garcia", "1234");
    }
}
