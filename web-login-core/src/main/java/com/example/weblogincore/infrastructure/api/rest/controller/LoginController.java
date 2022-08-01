package com.example.weblogincore.infrastructure.api.rest.controller;

import com.example.weblogincore.configuration.security.service.JwtService;
import com.example.weblogincore.domain.persistence.UserRepository;
import com.example.weblogincore.infrastructure.api.rest.model.LoginResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("login")
public class LoginController {
    private final JwtService jwtService;
    private final UserRepository userRepository;

    public LoginController(JwtService jwtService, UserRepository userRepository) {
        this.jwtService = jwtService;
        this.userRepository = userRepository;
    }

    @PostMapping
    public ResponseEntity<LoginResponse> login(@AuthenticationPrincipal User activeUser) {
        com.example.weblogincore.domain.model.User user = userRepository.findByEmail(activeUser.getUsername()).get();
        String token = jwtService.createToken(user.getEmail(), user.getId().toString());
        return ResponseEntity.ok(new LoginResponse(token));
    }
}
