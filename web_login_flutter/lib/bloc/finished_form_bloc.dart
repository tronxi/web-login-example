
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/models/form/attempt.dart';
import 'package:web_login_flutter/models/form/finished/finished_attempt.dart';
import 'package:web_login_flutter/models/form/finished/finished_form.dart';
import 'package:web_login_flutter/models/form/finished/finished_response.dart';
import 'package:web_login_flutter/repositories/finished_form_repository.dart';
import 'package:web_login_flutter/repositories/models/finished_form_response.dart';
import 'package:web_login_flutter/repositories/models/finished_response_response.dart';

abstract class FinishedFormEvent {}
class FinishedFormRetrieve extends FinishedFormEvent {
  final String userId;
  FinishedFormRetrieve({required this.userId});
}

abstract class FinishedFormState {}
class FinishedFormInitial extends FinishedFormState {}
class FinishedFormError extends FinishedFormState {}
class FinishedFormRetrieved extends FinishedFormState {
  final List<FinishedForm> finishedForm;
  FinishedFormRetrieved({required this.finishedForm});
}


class FinishedFormBloc extends Bloc<FinishedFormEvent, FinishedFormState> {
  late final FinishedFormRepository _finishedFormRepository;
  FinishedFormBloc(): super(FinishedFormInitial()) {
    _finishedFormRepository = FinishedFormRepository();
    on<FinishedFormRetrieve>((event, emit) async => emit(await _onFinishedFormState(event)));
  }

  Future<FinishedFormState> _onFinishedFormState(FinishedFormRetrieve finishedFormRetrieve) async {
    final response = await _finishedFormRepository.retrieve(finishedFormRetrieve.userId);
    return response.fold((left) => FinishedFormError(), (right) => FinishedFormRetrieved(finishedForm: _toDomainList(right.response)));
  }

  List<FinishedForm> _toDomainList(List<FinishedFormResponse> finishedFormResponses) {
    return finishedFormResponses
        .map((e) => _toDomain(e))
        .toList();
  }

  FinishedForm _toDomain(FinishedFormResponse finishedFormResponse) {

    Attempt attempt = Attempt(id: finishedFormResponse.finishedAttempts.attempt.id,
        userId: finishedFormResponse.finishedAttempts.attempt.userId,
        formId: finishedFormResponse.finishedAttempts.attempt.formId);
    List<FinishedResponse> responses = finishedFormResponse.finishedAttempts.responses
                    .map((e) => _toDomainResponse(e))
                    .toList();

    FinishedAttempt finishedAttempt = FinishedAttempt(attempt: attempt, responses: responses);
    return FinishedForm(formId: finishedFormResponse.formId,
        formName: finishedFormResponse.formName,
        formDescription: finishedFormResponse.formDescription,
        finishedAttempt: finishedAttempt);
  }

  FinishedResponse _toDomainResponse(FinishedResponseResponse finishedResponseResponse) {
    return FinishedResponse(id: finishedResponseResponse.id,
        questionType: finishedResponseResponse.questionType,
        title: finishedResponseResponse.title,
        description: finishedResponseResponse.description,
        response: finishedResponseResponse.response);
  }
}