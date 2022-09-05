package com.example.weblogincore.infrastructure.persistence.mapper;

import com.example.weblogincore.domain.model.user.User;
import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.CreateAttempt;
import com.example.weblogincore.domain.model.form.Form;
import com.example.weblogincore.infrastructure.persistence.entities.UserEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.AttemptEntity;
import com.example.weblogincore.infrastructure.persistence.entities.form.FormEntity;
import com.example.weblogincore.infrastructure.persistence.jpa.FormJPA;
import org.springframework.stereotype.Component;

@Component
public class AttemptEntityMapper {
    private final UserEntityMapper userEntityMapper;
    private final FormEntityMapper formEntityMapper;
    private final FormJPA formJPA;

    public AttemptEntityMapper(UserEntityMapper userEntityMapper, FormEntityMapper formEntityMapper, FormJPA formJPA) {
        this.userEntityMapper = userEntityMapper;
        this.formEntityMapper = formEntityMapper;
        this.formJPA = formJPA;
    }

    public AttemptEntity toEntity(CreateAttempt createAttempt) {
        UserEntity userEntity = userEntityMapper.toEntity(createAttempt.getUser());
        FormEntity formEntity = formEntityMapper.toEntityOnlyId(createAttempt.getForm());
        return new AttemptEntity(userEntity, formEntity, createAttempt.getAttemptStatus());
    }

    public AttemptEntity toEntity(Attempt attempt) {
        UserEntity userEntity = userEntityMapper.toEntity(attempt.getUser());
        FormEntity formEntity = formEntityMapper.toEntityOnlyId(attempt.getForm());
        return new AttemptEntity(attempt.getId(),userEntity, formEntity, attempt.getAttemptStatus());
    }

    public Attempt toDomain(AttemptEntity attemptEntity) {
        User user = userEntityMapper.toDomain(attemptEntity.getUser());
        Form form = formEntityMapper.toDomain(formJPA.getById(attemptEntity.getForm().getId()));
        return new Attempt(attemptEntity.getId(), user, form, attemptEntity.getAttemptStatus());
    }
}
