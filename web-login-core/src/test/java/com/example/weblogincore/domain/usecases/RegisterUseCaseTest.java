package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.RegisterUserOrder;
import com.example.weblogincore.domain.persistence.UserRepository;
import com.example.weblogincore.util.TestUtil;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
class RegisterUseCaseTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private RegisterUseCase registerUseCase;

    @Test
    public void shouldRegisterUser() {
        //GIVEN
        RegisterUserOrder registerUserOrder = TestUtil.getRegisterUserOrder();

        //WHEN
        registerUseCase.register(registerUserOrder);

        //THEN
        verify(userRepository).register(registerUserOrder);
    }

}