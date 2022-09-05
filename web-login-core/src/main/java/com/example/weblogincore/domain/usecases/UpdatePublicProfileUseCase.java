package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.user.UpdatePublicProfileOrder;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.persistence.UserRepository;
import com.example.weblogincore.domain.services.UserRetriever;
import org.springframework.stereotype.Service;

@Service
public class UpdatePublicProfileUseCase {
    private final UserRetriever userRetriever;
    private final UserRepository userRepository;

    public UpdatePublicProfileUseCase(UserRetriever userRetriever, UserRepository userRepository) {
        this.userRetriever = userRetriever;
        this.userRepository = userRepository;
    }

    public User update(UpdatePublicProfileOrder updatePublicProfileOrder) {
        User user = userRetriever.findById(updatePublicProfileOrder.getId());
        User updatedUser = new User(user.getId(),
                updatePublicProfileOrder.getEmail(),
                updatePublicProfileOrder.getName(),
                updatePublicProfileOrder.getSurname(),
                user.getPassword());
        return userRepository.update(updatedUser);
    }
}
