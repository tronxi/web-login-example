package com.example.weblogincore.infrastructure.persistence.adapter;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.AttemptStatus;
import com.example.weblogincore.domain.model.form.CreateAttempt;
import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.persistence.AttemptRepository;
import com.example.weblogincore.infrastructure.persistence.entities.UserEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.AttemptEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.FormEntity;
import com.example.weblogincore.infrastructure.persistence.jpa.AttemptJPA;
import com.example.weblogincore.infrastructure.persistence.jpa.FormJPA;
import com.example.weblogincore.infrastructure.persistence.mapper.AttemptEntityMapper;
import com.example.weblogincore.infrastructure.persistence.mapper.UserEntityMapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
public class AttemptRepositoryMysql implements AttemptRepository {

    private final AttemptEntityMapper attemptEntityMapper;
    private final UserEntityMapper userEntityMapper;
    private final AttemptJPA attemptJPA;

    private final FormJPA formJPA;

    public AttemptRepositoryMysql(AttemptEntityMapper attemptEntityMapper, UserEntityMapper userEntityMapper, AttemptJPA attemptJPA, FormJPA formJPA) {
        this.attemptEntityMapper = attemptEntityMapper;
        this.userEntityMapper = userEntityMapper;
        this.attemptJPA = attemptJPA;
        this.formJPA = formJPA;
    }

    @Override
    public Attempt create(CreateAttempt createAttempt) {
        AttemptEntity attemptEntity = attemptEntityMapper.toEntity(createAttempt);
        AttemptEntity savedAttempt = attemptJPA.save(attemptEntity);
        FormEntity formEntity = formJPA.findById(savedAttempt.getForm().getId())
                        .orElseThrow(RuntimeException::new);
        savedAttempt.setForm(formEntity);
        return attemptEntityMapper.toDomain(savedAttempt);
    }

    @Override
    public Optional<Attempt> findByid(Long id) {
        return attemptJPA.findById(id)
                .map(attemptEntityMapper::toDomain);
    }

    @Override
    public Attempt save(Attempt attempt) {
        AttemptEntity attemptEntity = attemptEntityMapper.toEntity(attempt);
        return attemptEntityMapper.toDomain(attemptJPA.save(attemptEntity));
    }

    @Override
    public List<Attempt> findFinishedByUser(User user) {
        UserEntity userEntity = userEntityMapper.toEntity(user);
        return attemptJPA.findByUserAndAttemptStatus(userEntity, AttemptStatus.FINISHED).stream()
                .map(attemptEntityMapper::toDomain)
                .collect(Collectors.toList());
    }
}
