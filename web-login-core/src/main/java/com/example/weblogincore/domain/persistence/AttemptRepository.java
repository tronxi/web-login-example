package com.example.weblogincore.domain.persistence;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.CreateAttempt;
import com.example.weblogincore.domain.model.user.User;

import java.util.List;
import java.util.Optional;

public interface AttemptRepository {
    Attempt create(CreateAttempt createAttempt);
    Optional<Attempt> findByid(Long id);

    Attempt save(Attempt attempt);
    List<Attempt> findFinishedByUser(User user);
}
