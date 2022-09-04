import 'package:equatable/equatable.dart';
import 'package:web_login_flutter/models/form/question.dart';

class Choice extends Equatable {
  final int _id;
  final String _name;
  final Question? _nextQuestion;

  const Choice({id, name, nextQuestion}):
      _id = id, _name = name, _nextQuestion = nextQuestion;

  @override
  List<Object?> get props => [_id, _name, _nextQuestion];

  int get id => _id;

  Question? get nextQuestion => _nextQuestion;

  String get name => _name;

  @override
  String toString() {
    return 'Choice{_id: $_id, _name: $_name, _nextQuestion: $_nextQuestion}';
  }
}