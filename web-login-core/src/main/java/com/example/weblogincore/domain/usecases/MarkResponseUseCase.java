package com.example.weblogincore.domain.usecases;

import com.example.weblogincore.domain.model.form.Attempt;
import com.example.weblogincore.domain.model.form.questions.Question;
import com.example.weblogincore.domain.model.form.Response;
import com.example.weblogincore.domain.model.form.ResponseOrder;
import com.example.weblogincore.domain.persistence.ResponseRepository;
import com.example.weblogincore.domain.services.AttemptRetriever;
import com.example.weblogincore.domain.services.QuestionRetriever;
import org.springframework.stereotype.Service;

@Service
public class MarkResponseUseCase {

    private final AttemptRetriever attemptRetriever;
    private final QuestionRetriever questionRetriever;
    private final ResponseRepository responseRepository;

    public MarkResponseUseCase(AttemptRetriever attemptRetriever, QuestionRetriever questionRetriever, ResponseRepository responseRepository) {
        this.attemptRetriever = attemptRetriever;
        this.questionRetriever = questionRetriever;
        this.responseRepository = responseRepository;
    }

    public Response mark(ResponseOrder responseOrder) {
        Attempt attempt = attemptRetriever.findById(responseOrder.getAttemptId());
        Question question = questionRetriever.findById(responseOrder.getQuestionId());

        Response response = new Response(attempt, question, responseOrder.getResponse());

        return responseRepository.save(response);
    }
}
