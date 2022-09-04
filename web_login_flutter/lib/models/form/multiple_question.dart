import 'package:web_login_flutter/models/form/question.dart';

import 'choice.dart';

class MultipleQuestion extends Question {
  final bool? _allowMultiple;
  final List<Choice> _choices;
  final Question? _defaultQuestion;

  const MultipleQuestion({required super.id, required super.title, required super.description, required super.imageUrl, required super.isMandatory, required allowMultiple, required choices, required defaultQuestion})
    : _allowMultiple = allowMultiple, _choices = choices, _defaultQuestion = defaultQuestion;

  @override
  List<Object?> get props => [];

  bool? get allowMultiple => _allowMultiple;

  List<Choice> get choices => _choices;

  Question? get defaultQuestion => _defaultQuestion;
}