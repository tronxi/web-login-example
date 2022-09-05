package com.example.weblogincore.infrastructure.api.rest.controller;

import com.example.weblogincore.domain.model.user.RegisterUserOrder;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.services.UserRetriever;
import com.example.weblogincore.domain.usecases.RegisterUseCase;
import com.example.weblogincore.domain.usecases.UpdatePrivateProfileUseCase;
import com.example.weblogincore.domain.usecases.UpdatePublicProfileUseCase;
import com.example.weblogincore.infrastructure.api.rest.mapper.UserMapper;
import com.example.weblogincore.infrastructure.api.rest.model.user.RegisterRequest;
import com.example.weblogincore.infrastructure.api.rest.model.user.UpdatePrivateProfileRequest;
import com.example.weblogincore.infrastructure.api.rest.model.user.UpdatePublicProfileRequest;
import com.example.weblogincore.infrastructure.api.rest.model.user.UserResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("users")
public class UserController {

    private final RegisterUseCase registerUseCase;
    private final UpdatePrivateProfileUseCase updatePrivateProfileUseCase;
    private final UpdatePublicProfileUseCase updatePublicProfileUseCase;
    private final UserRetriever userRetriever;
    private final UserMapper userMapper;

    public UserController(RegisterUseCase registerUseCase, UpdatePrivateProfileUseCase updatePrivateProfileUseCase, UpdatePublicProfileUseCase updatePublicProfileUseCase, UserRetriever userRetriever, UserMapper userMapper) {
        this.registerUseCase = registerUseCase;
        this.updatePrivateProfileUseCase = updatePrivateProfileUseCase;
        this.updatePublicProfileUseCase = updatePublicProfileUseCase;
        this.userRetriever = userRetriever;
        this.userMapper = userMapper;
    }

    @PostMapping
    public ResponseEntity<UserResponse> register(@RequestBody RegisterRequest registerRequest) {
        RegisterUserOrder registerUserOrder = userMapper.toOrder(registerRequest);
        User user = registerUseCase.register(registerUserOrder);
        return ResponseEntity.ok(userMapper.toResponse(user));
    }

    @GetMapping("/{id}")
    @PreAuthorize("authenticated")
    public ResponseEntity<UserResponse> findById(@PathVariable Long id) {
        User user = userRetriever.findById(id);
        return ResponseEntity.ok(userMapper.toResponse(user));
    }

    @PutMapping("/{id}/public")
    @PreAuthorize("authenticated")
    public ResponseEntity<UserResponse> updatePublicProfile(@PathVariable Long id,
                                                            @RequestBody UpdatePublicProfileRequest updatePublicProfileRequest) {
        User user = updatePublicProfileUseCase.update(userMapper.toOrder(id, updatePublicProfileRequest));
        return ResponseEntity.ok(userMapper.toResponse(user));
    }

    @PutMapping("/{id}/private")
    @PreAuthorize("authenticated")
    public ResponseEntity<UserResponse> updatePrivateProfile(@PathVariable Long id,
                                                             @RequestBody UpdatePrivateProfileRequest updatePrivateProfileRequest) {
        User user = updatePrivateProfileUseCase.update(userMapper.toOrder(id, updatePrivateProfileRequest));
        return ResponseEntity.ok(userMapper.toResponse(user));
    }
}
