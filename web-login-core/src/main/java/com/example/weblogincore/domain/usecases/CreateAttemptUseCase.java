package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.AttemptStatus;
import com.example.weblogincore.domain.model.form.CreateAttempt;
import com.example.weblogincore.domain.model.form.Form;
import com.example.weblogincore.domain.persistence.AttemptRepository;
import com.example.weblogincore.domain.services.FormRetriever;
import com.example.weblogincore.domain.services.UserRetriever;
import org.springframework.stereotype.Service;

@Service
public class CreateAttemptUseCase {

    private final UserRetriever userRetriever;
    private final FormRetriever formRetriever;
    private final AttemptRepository attemptRepository;

    public CreateAttemptUseCase(UserRetriever userRetriever, FormRetriever formRetriever, AttemptRepository attemptRepository) {
        this.userRetriever = userRetriever;
        this.formRetriever = formRetriever;
        this.attemptRepository = attemptRepository;
    }

    public Attempt create(Long userId, Long formId) {
        User user = userRetriever.findById(userId);
        Form form = formRetriever.retrieve();
        CreateAttempt createAttempt = new CreateAttempt(user, form, AttemptStatus.PENDING);
        return attemptRepository.create(createAttempt);
    }
}
