import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/models/form/bool_question.dart';
import 'package:web_login_flutter/models/form/choice.dart';
import 'package:web_login_flutter/models/form/form.dart';
import 'package:web_login_flutter/models/form/multiple_question.dart';
import 'package:web_login_flutter/models/form/question.dart';
import 'package:web_login_flutter/models/form/section.dart';
import 'package:web_login_flutter/models/form/text_question.dart';

abstract class FlowFormEvent {}

class AnswerTextQuestion extends FlowFormEvent{
  late final String response;
  AnswerTextQuestion({required this.response});

  @override
  String toString() {
    return 'AnswerTextQuestion{response: $response}';
  }
}

class AnswerBoolQuestion extends FlowFormEvent{
  late final bool response;
  AnswerBoolQuestion({required this.response});

  @override
  String toString() {
    return 'AnswerBoolQuestion{response: $response}';
  }
}

class AnswerMultipleQuestion extends FlowFormEvent{
  late final List<Choice> response;
  AnswerMultipleQuestion({required this.response});

  @override
  String toString() {
    return 'AnswerMultipleQuestion{response: $response}';
  }
}

class FlowFormPrevious extends FlowFormEvent{}


class FormState {
  final FormModel _form;
  final Section _actualSection;
  final Question _actualQuestion;
  final int _responses;
  FormState({required form, required actualSection, required actualQuestion, required responses}):
        _form = form, _actualSection = actualSection, _actualQuestion = actualQuestion, _responses = responses;


  FormModel get form => _form;

  Question get actualQuestion => _actualQuestion;

  Section get actualSection => _actualSection;

  int get responses => _responses;
}

abstract class FlowFormState {}
class FlowFormInitial extends FlowFormState {}
class FlowFormAnswered extends FlowFormState {
  final FormState _state;

  FlowFormAnswered({required state}):
    _state = state;

  FormState get formState => _state;
}

class FlowFormFinished extends FlowFormState {}

class FlowFormBloc extends Bloc<FlowFormEvent, FlowFormState> {
  late FormModel _form;
  late Section _actualSection;
  late Question _actualQuestion;
  late int _responses;
  late List<FormState> _historyState;
  FlowFormBloc({required form}): super(FlowFormInitial()) {
    _form = form;
    _actualSection = form.sections.first;
    _actualQuestion = form.sections.first.question;
    _responses = 0;
    _historyState = [];

    on<FlowFormPrevious>((event, emit) => emit(_previousQuestion(event)));
    on<AnswerTextQuestion>((event, emit) => emit(_answerTextQuestion(event)));
    on<AnswerBoolQuestion>((event, emit) => emit(_answerBoolQuestion(event)));
    on<AnswerMultipleQuestion>((event, emit) => emit(_answerMultipleQuestion(event)));
  }

  FlowFormState _previousQuestion(FlowFormPrevious flowFormPrevious) {
    FormState state = _historyState.removeLast();
    _form = state.form;
    _actualSection = state.actualSection;
    _actualQuestion = state.actualQuestion;
    _responses = state.responses;
    return FlowFormAnswered(state: state);
  }

  FlowFormState _answerTextQuestion(AnswerTextQuestion answerTextQuestion) {
    FormState previousState = FormState(form: _form, actualSection: _actualSection, actualQuestion: _actualQuestion, responses: _responses);
    _historyState.add(previousState);
    TextQuestion textQuestion = _actualQuestion as TextQuestion;

    if(textQuestion.hasNextQuestion) {
      _actualQuestion = textQuestion.nextQuestion!;
    }
    else {
      if(_form.isLastSection(_actualSection)) return FlowFormFinished();

      _actualSection = _form.nextSectionTo(_actualSection);
      _actualQuestion = _actualSection.question;

    }
    _responses += 1;
    FormState state = FormState(form: _form, actualSection: _actualSection, actualQuestion: _actualQuestion, responses: _responses);
    return FlowFormAnswered(state: state);
  }

  FlowFormState _answerBoolQuestion(AnswerBoolQuestion answerBoolQuestion) {
    FormState previousState = FormState(form: _form, actualSection: _actualSection, actualQuestion: _actualQuestion, responses: _responses);
    _historyState.add(previousState);
    BoolQuestion boolQuestion = _actualQuestion as BoolQuestion;

    if(answerBoolQuestion.response) {
      if(boolQuestion.hasNextQuestionIfTrue) {
        _actualQuestion = boolQuestion.nextQuestionIfTrue!;
      } else {
        if(_form.isLastSection(_actualSection)) return FlowFormFinished();

        _actualSection = _form.nextSectionTo(_actualSection);
        _actualQuestion = _actualSection.question;
      }
    }
    else {
      if(boolQuestion.hasNextQuestionIfFalse) {
        _actualQuestion = boolQuestion.nextQuestionIfFalse!;
      } else {
        if(_form.isLastSection(_actualSection)) return FlowFormFinished();

        _actualSection = _form.nextSectionTo(_actualSection);
        _actualQuestion = _actualSection.question;
      }
    }
    _responses += 1;
    FormState state = FormState(form: _form, actualSection: _actualSection, actualQuestion: _actualQuestion, responses: _responses);
    return FlowFormAnswered(state: state);
  }

  FlowFormState _answerMultipleQuestion(AnswerMultipleQuestion answerMultipleQuestion) {
    FormState previousState = FormState(form: _form, actualSection: _actualSection, actualQuestion: _actualQuestion, responses: _responses);
    _historyState.add(previousState);
    MultipleQuestion multipleQuestion = _actualQuestion as MultipleQuestion;
    if(answerMultipleQuestion.response.isEmpty) {
        if(multipleQuestion.defaultQuestion != null) {
          _actualQuestion = multipleQuestion.defaultQuestion!;
        }else {
          if(_form.isLastSection(_actualSection)) return FlowFormFinished();

          _actualSection = _form.nextSectionTo(_actualSection);
          _actualQuestion = _actualSection.question;
        }
    }
    else if(answerMultipleQuestion.response.first.nextQuestion != null) {
        _actualQuestion = answerMultipleQuestion.response.first.nextQuestion!;
    } else {
        if(_form.isLastSection(_actualSection)) return FlowFormFinished();

        _actualSection = _form.nextSectionTo(_actualSection);
        _actualQuestion = _actualSection.question;
    }
    _responses += 1;
    FormState state = FormState(form: _form, actualSection: _actualSection, actualQuestion: _actualQuestion, responses: _responses);
    return FlowFormAnswered(state: state);
  }

}