import 'package:web_login_flutter/models/form/question.dart';

class TextQuestion extends Question {
  final Question? _nextQuestion;
  const TextQuestion({required super.id, required super.title, required super.description, required super.imageUrl, required super.isMandatory, nextQuestion}):
    _nextQuestion = nextQuestion;

  @override
  String toString() {
    return '${super.toString()}TextQuestion{_nextQuestion: $_nextQuestion}';
  }

  Question? get nextQuestion => _nextQuestion;

  bool get hasNextQuestion => _nextQuestion != null;

  @override
  List<Object?> get props => [];
}