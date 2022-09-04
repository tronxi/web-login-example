import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/models/form/bool_question.dart';
import 'package:web_login_flutter/models/form/choice.dart';
import 'package:web_login_flutter/models/form/form.dart';
import 'package:web_login_flutter/models/form/multiple_question.dart';
import 'package:web_login_flutter/models/form/question.dart';
import 'package:web_login_flutter/models/form/section.dart';
import 'package:web_login_flutter/models/form/text_question.dart';
import 'package:web_login_flutter/repositories/form_repository.dart';
import 'package:web_login_flutter/repositories/models/choice_response.dart';
import 'package:web_login_flutter/repositories/models/form_response.dart';
import 'package:web_login_flutter/repositories/models/question_response.dart';
import 'package:web_login_flutter/repositories/models/section_response.dart';

abstract class FormEvent {}
class FormRetrieve extends FormEvent {}

abstract class FormState {}
class FormInitial extends FormState {}
class FormRetrieved extends FormState {
  final FormModel _form;
  FormRetrieved({required form}): _form = form;
  FormModel get form => _form;
}
class FormError extends FormState {}

class FormBloc extends Bloc<FormEvent, FormState> {

  late final FormRepository _formRepository;
  FormBloc(): super(FormInitial()) {
    _formRepository = FormRepository();
    on<FormRetrieve>((event, emit) async => emit(await _onFormRetrieve()));
  }

  Future<FormState> _onFormRetrieve() async {
    final response = await _formRepository.retrieve();
    return response.fold((left) => FormError(), (right) => _mapForm(right.response));
  }

  FormState _mapForm(FormResponse formResponse) {
    List<Section> sections = formResponse.sectionResponses
        .map((e) => _toSection(e))
        .toList();
    FormModel form = FormModel(id: formResponse.id,
        description: formResponse.description,
        name: formResponse.name,
        totalQuestions: formResponse.totalQuestions,
        totalSections: formResponse.totalSections,
        sections: sections);
    return FormRetrieved(form: form);
  }

  Section _toSection(SectionResponse sectionResponse) {
    return Section(id: sectionResponse.id,
        name: sectionResponse.name,
        description: sectionResponse.description,
        totalQuestions: sectionResponse.totalQuestions,
        question: _toQuestion(sectionResponse.questionResponse));
  }

  Question? _toQuestion(QuestionResponse questionResponse) {
    if(questionResponse.questionType == "TEXT_TYPE") {
      return _toTextQuestion(questionResponse);
    } else if(questionResponse.questionType == "BOOLEAN_TYPE") {
      return _toBoolQuestion(questionResponse);
    } else if(questionResponse.questionType == "MULTIPLE_TYPE") {
      return _toMultipleQuestion(questionResponse);
    } else {
      return null;
    }
  }

  TextQuestion _toTextQuestion(QuestionResponse questionResponse) {
    Question? nextQuestion;
    if(questionResponse.nextQuestion != null) {
      nextQuestion = _toQuestion(questionResponse.nextQuestion!);
    }
    return TextQuestion(id: questionResponse.id,
        title: questionResponse.title,
        description: questionResponse.description,
        imageUrl: questionResponse.imageUrl,
        isMandatory: questionResponse.mandatory,
        nextQuestion: nextQuestion);
  }

  BoolQuestion _toBoolQuestion(QuestionResponse questionResponse) {
    Question? nextQuestionIfTrue;
    if(questionResponse.nextQuestionIfTrue != null) {
      nextQuestionIfTrue = _toQuestion(questionResponse.nextQuestionIfTrue!);
    }
    Question? nextQuestionIfFalse;
    if(questionResponse.nextQuestionIfFalse != null) {
      nextQuestionIfFalse = _toQuestion(questionResponse.nextQuestionIfFalse!);
    }
    return BoolQuestion(id: questionResponse.id,
        title: questionResponse.title,
        description: questionResponse.description,
        imageUrl: questionResponse.imageUrl,
        isMandatory: questionResponse.mandatory,
        nextQuestionIfTrue: nextQuestionIfTrue,
        nextQuestionIfFalse: nextQuestionIfFalse);
  }

  MultipleQuestion _toMultipleQuestion(QuestionResponse questionResponse) {
    List<Choice> choices = questionResponse.choices!
        .map((e) => _toChoice(e))
        .toList();
    Question? defaultQuestion;
    if(questionResponse.defaultQuestion != null) {
      defaultQuestion = _toQuestion(questionResponse.defaultQuestion!);
    }
    return MultipleQuestion(id: questionResponse.id,
        title: questionResponse.title,
        description: questionResponse.description,
        imageUrl: questionResponse.imageUrl,
        isMandatory: questionResponse.mandatory,
        allowMultiple: questionResponse.allowMultiple,
        defaultQuestion: defaultQuestion,
        choices: choices);
  }

  Choice _toChoice(ChoiceResponse choiceResponse) {
    Question? nextQuestion;
    if(choiceResponse.nextQuestion != null) {
      nextQuestion = _toQuestion(choiceResponse.nextQuestion!);
    }
    return Choice(id: choiceResponse.id, name: choiceResponse.name, nextQuestion: nextQuestion);
  }
}