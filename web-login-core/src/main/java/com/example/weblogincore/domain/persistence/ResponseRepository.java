package com.example.weblogincore.domain.persistence;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.DeleteResponseOrder;
import com.example.weblogincore.domain.model.form.Response;

import java.util.List;

public interface ResponseRepository {
    Response save(Response response);
    void delete(DeleteResponseOrder deleteResponseOrder);
    List<Response> findByAttempt(Attempt attempt);

}
