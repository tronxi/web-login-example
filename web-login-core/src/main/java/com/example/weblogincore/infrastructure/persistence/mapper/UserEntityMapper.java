package com.example.weblogincore.infrastructure.persistence.mapper;

import com.example.weblogincore.domain.model.user.RegisterUserOrder;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.infrastructure.persistence.entities.UserEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class UserEntityMapper {
    public User toDomain(UserEntity userEntity) {
        return new User(userEntity.getId(), userEntity.getEmail(), userEntity.getName(), userEntity.getSurname(), userEntity.getPassword());
    }

    public UserEntity toEntity(RegisterUserOrder registerUserOrder) {
        return new UserEntity(registerUserOrder.getEmail(), registerUserOrder.getName(), registerUserOrder.getSurname(), new BCryptPasswordEncoder().encode(registerUserOrder.getPassword()));
    }

    public UserEntity toEntity(User user) {
        return new UserEntity(user.getId(), user.getEmail(), user.getName(), user.getSurname(), user.getPassword());
    }

    public UserEntity modifyPassword(User user, String password) {
        return new UserEntity(user.getId(), user.getEmail(), user.getName(), user.getSurname(), new BCryptPasswordEncoder().encode(password));
    }
}
