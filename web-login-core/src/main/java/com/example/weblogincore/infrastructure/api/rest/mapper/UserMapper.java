package com.example.weblogincore.infrastructure.api.rest.mapper;

import com.example.weblogincore.domain.model.user.RegisterUserOrder;
import com.example.weblogincore.domain.model.user.UpdatePrivateProfileOrder;
import com.example.weblogincore.domain.model.user.UpdatePublicProfileOrder;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.infrastructure.api.rest.model.user.RegisterRequest;
import com.example.weblogincore.infrastructure.api.rest.model.user.UpdatePrivateProfileRequest;
import com.example.weblogincore.infrastructure.api.rest.model.user.UpdatePublicProfileRequest;
import com.example.weblogincore.infrastructure.api.rest.model.user.UserResponse;
import org.springframework.stereotype.Component;

@Component
public class UserMapper {

    public UserResponse toResponse(User user) {
        return new UserResponse(user.getId(), user.getEmail(), user.getName(), user.getSurname());
    }

    public RegisterUserOrder toOrder(RegisterRequest registerRequest) {
        return new RegisterUserOrder(registerRequest.getEmail(),
                registerRequest.getName(),
                registerRequest.getSurname(),
                registerRequest.getPassword());
    }

    public UpdatePublicProfileOrder toOrder(Long id, UpdatePublicProfileRequest updatePublicProfileRequest) {
        return new UpdatePublicProfileOrder(id, updatePublicProfileRequest.getEmail(), updatePublicProfileRequest.getName(), updatePublicProfileRequest.getSurname());
    }

    public UpdatePrivateProfileOrder toOrder(Long id, UpdatePrivateProfileRequest updatePrivateProfileRequest) {
        return new UpdatePrivateProfileOrder(id, updatePrivateProfileRequest.getOldPassword(), updatePrivateProfileRequest.getNewPassword());
    }
}
