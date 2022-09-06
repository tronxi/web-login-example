import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/models/form/attempt.dart';
import 'package:web_login_flutter/models/form/bool_question.dart';
import 'package:web_login_flutter/models/form/choice.dart';
import 'package:web_login_flutter/models/form/form.dart';
import 'package:web_login_flutter/models/form/multiple_question.dart';
import 'package:web_login_flutter/models/form/question.dart';
import 'package:web_login_flutter/models/form/range_question.dart';
import 'package:web_login_flutter/models/form/section.dart';
import 'package:web_login_flutter/models/form/text_question.dart';
import 'package:web_login_flutter/repositories/attempt_repository.dart';
import 'package:web_login_flutter/repositories/models/attempt_response.dart';

abstract class FlowFormEvent {}

class AnswerTextQuestion extends FlowFormEvent {
  late final String response;
  AnswerTextQuestion({required this.response});

  @override
  String toString() {
    return 'AnswerTextQuestion{response: $response}';
  }
}

class AnswerRangeQuestion extends FlowFormEvent {
  late final double response;
  AnswerRangeQuestion({required this.response});

  @override
  String toString() {
    return 'AnswerRangeQuestion{response: ${response.toString()}}';
  }
}

class AnswerBoolQuestion extends FlowFormEvent {
  late final bool response;
  AnswerBoolQuestion({required this.response});

  @override
  String toString() {
    return 'AnswerBoolQuestion{response: $response}';
  }
}

class AnswerMultipleQuestion extends FlowFormEvent {
  late final List<Choice> response;
  AnswerMultipleQuestion({required this.response});

  @override
  String toString() {
    return 'AnswerMultipleQuestion{response: $response}';
  }
}

class CreateAttempt extends FlowFormEvent {
  late final String userId;
  late final int formId;
  CreateAttempt({required this.userId, required this.formId});
}

class FinishAttempt extends FlowFormEvent {
  late final int attemptId;
  FinishAttempt({required this.attemptId});
}

class FlowFormPrevious extends FlowFormEvent {}

class FormState {
  final FormModel _form;
  final Section _actualSection;
  final Question _actualQuestion;
  final int _responses;
  FormState(
      {required form,
      required actualSection,
      required actualQuestion,
      required responses})
      : _form = form,
        _actualSection = actualSection,
        _actualQuestion = actualQuestion,
        _responses = responses;

  FormModel get form => _form;

  Question get actualQuestion => _actualQuestion;

  Section get actualSection => _actualSection;

  int get responses => _responses;
}

abstract class FlowFormState {}

class FlowFormInitial extends FlowFormState {}

class FlowFormAnswered extends FlowFormState {
  final FormState _state;

  FlowFormAnswered({required state}) : _state = state;

  FormState get formState => _state;
}

class WaitingForFinish extends FlowFormState {
  final int attemptId;

  WaitingForFinish({required this.attemptId});
}

class FlowFormFinished extends FlowFormState {}

class FlowFormError extends FlowFormState {}

class FlowFormBloc extends Bloc<FlowFormEvent, FlowFormState> {
  late final AttemptRepository _attemptRepository;
  late FormModel _form;
  late Section _actualSection;
  late Question _actualQuestion;
  late int _responses;
  late List<FormState> _historyState;
  late Attempt _attempt;
  FlowFormBloc({required form}) : super(FlowFormInitial()) {
    _attemptRepository = AttemptRepository();
    _form = form;
    _actualSection = form.sections.first;
    _actualQuestion = form.sections.first.question;
    _responses = 0;
    _historyState = [];

    on<CreateAttempt>((event, emit) async => emit(await _createAttempt(event)));
    on<FinishAttempt>((event, emit) async => emit(await _finishAttempt(event)));
    on<FlowFormPrevious>((event, emit) => emit(_previousQuestion(event)));
    on<AnswerTextQuestion>((event, emit) => emit(_answerTextQuestion(event)));
    on<AnswerBoolQuestion>((event, emit) => emit(_answerBoolQuestion(event)));
    on<AnswerRangeQuestion>((event, emit) => emit(_answerRangeQuestion(event)));
    on<AnswerMultipleQuestion>(
        (event, emit) => emit(_answerMultipleQuestion(event)));
  }

  Future<FlowFormState> _createAttempt(CreateAttempt createAttempt) async {
    final response = await _attemptRepository.create(
        createAttempt.userId, createAttempt.formId);
    if (response.isLeft) {
      return FlowFormError();
    }
    _attempt = _toDomain(response.right.response);
    FormState state = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    return FlowFormAnswered(state: state);
  }

  Future<FlowFormState> _finishAttempt(FinishAttempt finishAttempt) async {
    final response = await _attemptRepository.finish(finishAttempt.attemptId);
    if (response.isLeft) {
      return FlowFormError();
    }
    return FlowFormFinished();
  }

  Attempt _toDomain(AttemptResponse attemptResponse) {
    return Attempt(
        id: attemptResponse.id,
        userId: attemptResponse.userId,
        formId: attemptResponse.formId);
  }

  FlowFormState _previousQuestion(FlowFormPrevious flowFormPrevious) {
    FormState state = _historyState.removeLast();
    _form = state.form;
    _actualSection = state.actualSection;
    _actualQuestion = state.actualQuestion;
    _responses = state.responses;
    _attemptRepository.deleteResponse(_attempt.id, _actualQuestion.id);
    return FlowFormAnswered(state: state);
  }

  FlowFormState _answerTextQuestion(AnswerTextQuestion answerTextQuestion) {
    FormState previousState = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    _historyState.add(previousState);
    TextQuestion textQuestion = _actualQuestion as TextQuestion;
    _attemptRepository.response(_attempt.id, textQuestion.id, answerTextQuestion.response);
    if (textQuestion.hasNextQuestion) {
      _actualQuestion = textQuestion.nextQuestion!;
    } else {
      if (_form.isLastSection(_actualSection)) {
        return WaitingForFinish(attemptId: _attempt.id);
      }

      _actualSection = _form.nextSectionTo(_actualSection);
      _actualQuestion = _actualSection.question;
    }
    _responses += 1;
    FormState state = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    return FlowFormAnswered(state: state);
  }

  FlowFormState _answerRangeQuestion(AnswerRangeQuestion answerRangeQuestion) {
    FormState previousState = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    _historyState.add(previousState);
    RangeQuestion rangeQuestion = _actualQuestion as RangeQuestion;
    _attemptRepository.response(_attempt.id, rangeQuestion.id, answerRangeQuestion.response.toString());
    if (rangeQuestion.hasNextQuestion) {
      _actualQuestion = rangeQuestion.nextQuestion!;
    } else {
      if (_form.isLastSection(_actualSection)) {
        return WaitingForFinish(attemptId: _attempt.id);
      }

      _actualSection = _form.nextSectionTo(_actualSection);
      _actualQuestion = _actualSection.question;
    }
    _responses += 1;
    FormState state = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    return FlowFormAnswered(state: state);
  }

  FlowFormState _answerBoolQuestion(AnswerBoolQuestion answerBoolQuestion) {
    FormState previousState = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    _historyState.add(previousState);
    BoolQuestion boolQuestion = _actualQuestion as BoolQuestion;
    _attemptRepository.response(_attempt.id, boolQuestion.id, answerBoolQuestion.response.toString());
    if (answerBoolQuestion.response) {
      if (boolQuestion.hasNextQuestionIfTrue) {
        _actualQuestion = boolQuestion.nextQuestionIfTrue!;
      } else {
        if (_form.isLastSection(_actualSection)) {
          return WaitingForFinish(attemptId: _attempt.id);
        }

        _actualSection = _form.nextSectionTo(_actualSection);
        _actualQuestion = _actualSection.question;
      }
    } else {
      if (boolQuestion.hasNextQuestionIfFalse) {
        _actualQuestion = boolQuestion.nextQuestionIfFalse!;
      } else {
        if (_form.isLastSection(_actualSection)) {
          return WaitingForFinish(attemptId: _attempt.id);
        }

        _actualSection = _form.nextSectionTo(_actualSection);
        _actualQuestion = _actualSection.question;
      }
    }
    _responses += 1;
    FormState state = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    return FlowFormAnswered(state: state);
  }

  FlowFormState _answerMultipleQuestion(
      AnswerMultipleQuestion answerMultipleQuestion) {
    FormState previousState = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    _historyState.add(previousState);
    MultipleQuestion multipleQuestion = _actualQuestion as MultipleQuestion;
    for(Choice choice in answerMultipleQuestion.response) {
      _attemptRepository.response(_attempt.id, multipleQuestion.id, choice.name);
    }

    if (answerMultipleQuestion.response.isEmpty) {
      if (multipleQuestion.defaultQuestion != null) {
        _actualQuestion = multipleQuestion.defaultQuestion!;
      } else {
        if (_form.isLastSection(_actualSection)) {
          return WaitingForFinish(attemptId: _attempt.id);
        }

        _actualSection = _form.nextSectionTo(_actualSection);
        _actualQuestion = _actualSection.question;
      }
    } else if (answerMultipleQuestion.response.first.nextQuestion != null) {
      _actualQuestion = answerMultipleQuestion.response.first.nextQuestion!;
    } else {
      if (_form.isLastSection(_actualSection)) {
        return WaitingForFinish(attemptId: _attempt.id);
      }

      _actualSection = _form.nextSectionTo(_actualSection);
      _actualQuestion = _actualSection.question;
    }
    _responses += 1;
    FormState state = FormState(
        form: _form,
        actualSection: _actualSection,
        actualQuestion: _actualQuestion,
        responses: _responses);
    return FlowFormAnswered(state: state);
  }
}
