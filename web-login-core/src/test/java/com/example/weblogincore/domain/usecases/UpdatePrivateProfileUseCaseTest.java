package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.exceptions.PasswordNotMatchesException;
import com.example.weblogincore.domain.model.UpdatePrivateProfileOrder;
import com.example.weblogincore.domain.model.User;
import com.example.weblogincore.domain.persistence.UserRepository;
import com.example.weblogincore.domain.services.UserRetriever;
import com.example.weblogincore.util.TestUtil;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UpdatePrivateProfileUseCaseTest {

    @Mock
    private UserRetriever userRetriever;

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UpdatePrivateProfileUseCase updatePrivateProfileUseCase;

    @Test
    public void shouldChangePasswordWhenOldPasswordIsCorrect() {
        //GIVEN
        User initialUser = TestUtil.getUser();
        UpdatePrivateProfileOrder updatePrivateProfileOrder = TestUtil.getUpdatePrivateProfileOrderCorrect();
        when(userRetriever.findById(TestUtil.ID)).thenReturn(initialUser);

        //WHEN
        updatePrivateProfileUseCase.update(updatePrivateProfileOrder);

        //THEN
        verify(userRepository).modifyPassword(initialUser, updatePrivateProfileOrder.getNewPassword());
    }

    @Test
    public void shouldThrowExceptionWhenOldIsIncorrect() {
        //GIVEN
        User initialUser = TestUtil.getUser();
        UpdatePrivateProfileOrder updatePrivateProfileOrder = TestUtil.getUpdatePrivateProfileOrderIncorrect();
        when(userRetriever.findById(TestUtil.ID)).thenReturn(initialUser);

        //WHEN
        assertThrows(PasswordNotMatchesException.class, () -> {
            updatePrivateProfileUseCase.update(updatePrivateProfileOrder);
        });
    }

}