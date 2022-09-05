package com.example.weblogincore.domain.services;

import com.example.weblogincore.domain.exceptions.UserNotFoundException;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.persistence.UserRepository;
import com.example.weblogincore.util.TestUtil;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class UserRetrieverTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserRetriever userRetriever;

    @Test
    public void shouldReturnUserWhenUserExist() {
        //GIVEN
        User expectedUser = TestUtil.getUser();
        when(userRepository.findById(TestUtil.ID)).thenReturn(Optional.of(expectedUser));

        //WHEN
        User user = userRetriever.findById(TestUtil.ID);

        //THEN
        assertEquals(user, expectedUser);
    }

    @Test
    public void shouldThrowExceptionWhenUserNotExist() {
        //GIVEN
        User expectedUser = TestUtil.getUser();
        when(userRepository.findById(TestUtil.INCORRECT_ID)).thenReturn(Optional.empty());

        //WHEN
        assertThrows(UserNotFoundException.class, () -> {
            userRetriever.findById(TestUtil.INCORRECT_ID);
        });

    }


}