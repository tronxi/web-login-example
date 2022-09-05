package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.form.DeleteResponseOrder;
import com.example.weblogincore.domain.persistence.ResponseRepository;
import org.springframework.stereotype.Component;

@Component
public class DeleteResponseUseCase {

    private final ResponseRepository responseRepository;

    public DeleteResponseUseCase(ResponseRepository responseRepository) {
        this.responseRepository = responseRepository;
    }

    public void delete(DeleteResponseOrder deleteResponseOrder) {
        responseRepository.delete(deleteResponseOrder);
    }
}
