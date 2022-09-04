import 'package:web_login_flutter/models/form/question.dart';

class BoolQuestion extends Question {
  final Question? _nextQuestionIfTrue;
  final Question? _nextQuestionIfFalse;
  const BoolQuestion({required super.id, required super.title, required super.description, required super.imageUrl, required super.isMandatory, nextQuestionIfTrue, nextQuestionIfFalse}):
        _nextQuestionIfTrue = nextQuestionIfTrue,
        _nextQuestionIfFalse = nextQuestionIfFalse;

  @override
  String toString() {
    return '${super.toString()}BoolQuestion{_nextQuestionIfTrue: $_nextQuestionIfTrue, _nextQuestionIfFalse: $_nextQuestionIfFalse}';
  }

  Question? get nextQuestionIfTrue => _nextQuestionIfTrue;

  Question? get nextQuestionIfFalse => _nextQuestionIfFalse;

  @override
  List<Object?> get props => [];

  bool get hasNextQuestionIfTrue => _nextQuestionIfTrue != null;

  bool get hasNextQuestionIfFalse => _nextQuestionIfFalse != null;

}