package com.example.weblogincore.infrastructure.persistence.adapter;

import com.example.weblogincore.domain.model.RegisterUserOrder;
import com.example.weblogincore.domain.model.User;
import com.example.weblogincore.domain.persistence.UserRepository;
import com.example.weblogincore.infrastructure.persistence.entities.UserEntity;
import com.example.weblogincore.infrastructure.persistence.jpa.UserJPA;
import com.example.weblogincore.infrastructure.persistence.mapper.UserEntityMapper;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class UserRepositoryMysql implements UserRepository {

    private final UserJPA userJPA;
    private final UserEntityMapper userEntityMapper;

    public UserRepositoryMysql(UserJPA userJPA, UserEntityMapper userEntityMapper) {
        this.userJPA = userJPA;
        this.userEntityMapper = userEntityMapper;
    }

    @Override
    public Optional<User> findByEmail(String email) {
        return userJPA.findByEmail(email)
                .map(userEntityMapper::toDomain)
                .or(Optional::empty);
    }

    @Override
    public Optional<User> findById(Long id) {
        return userJPA.findById(id)
                .map(userEntityMapper::toDomain)
                .or(Optional::empty);
    }

    @Override
    public User register(RegisterUserOrder registerUserOrder) {
        UserEntity userEntity = userEntityMapper.toEntity(registerUserOrder);
        userJPA.save(userEntity);
        return userEntityMapper.toDomain(userEntity);
    }

    @Override
    public User update(User user) {
        UserEntity userEntity = userEntityMapper.toEntity(user);
        userJPA.save(userEntity);
        return userEntityMapper.toDomain(userEntity);
    }

    @Override
    public User modifyPassword(User user, String password) {
        UserEntity userEntity = userEntityMapper.modifyPassword(user, password);
        userJPA.save(userEntity);
        return userEntityMapper.toDomain(userEntity);
    }

    @Override
    public Optional<String> findEncryptedPasswordById(Long id) {
        return Optional.empty();
    }
}
