package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.user.UpdatePublicProfileOrder;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.persistence.UserRepository;
import com.example.weblogincore.domain.services.UserRetriever;
import com.example.weblogincore.util.TestUtil;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class UpdatePublicProfileUseCaseTest {

    @Mock
    private UserRetriever userRetriever;

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UpdatePublicProfileUseCase updatePublicProfileUseCase;

    @Test
    public void shouldUpdateUserWhenExist() {
        //GIVEN
        User initialUser = TestUtil.getUser();
        User updatedUser = TestUtil.getUpdatedUser();
        UpdatePublicProfileOrder updatePublicProfileOrder = TestUtil.getUpdatePublicProfileOrder();
        when(userRetriever.findById(TestUtil.ID)).thenReturn(initialUser);
        when(userRepository.update(updatedUser)).thenReturn(updatedUser);

        //WHEN
        User user = updatePublicProfileUseCase.update(updatePublicProfileOrder);

        //THEN
        assertEquals(user, updatedUser);
    }

}