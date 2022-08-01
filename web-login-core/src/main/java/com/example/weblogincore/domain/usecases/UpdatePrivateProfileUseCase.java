package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.exceptions.PasswordNotMatchesException;
import com.example.weblogincore.domain.exceptions.UserNotFoundException;
import com.example.weblogincore.domain.model.UpdatePrivateProfileOrder;
import com.example.weblogincore.domain.model.User;
import com.example.weblogincore.domain.persistence.UserRepository;
import com.example.weblogincore.domain.services.UserRetriever;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UpdatePrivateProfileUseCase {
    private final UserRetriever userRetriever;
    private final UserRepository userRepository;

    public UpdatePrivateProfileUseCase(UserRetriever userRetriever, UserRepository userRepository) {
        this.userRetriever = userRetriever;
        this.userRepository = userRepository;
    }

    public User update(UpdatePrivateProfileOrder updatePrivateProfileOrder) {
        User user = userRetriever.findById(updatePrivateProfileOrder.getId());
        if (passwordAreEquals(user.getPassword(), updatePrivateProfileOrder.getOldPassword())) {
           return userRepository.modifyPassword(user, updatePrivateProfileOrder.getNewPassword());
        } else {
           throw new PasswordNotMatchesException();
       }
    }

    private boolean passwordAreEquals(String oldEncryptedPassword, String oldPassword) {
        return new BCryptPasswordEncoder().matches(oldPassword, oldEncryptedPassword);
    }
}
