import 'package:web_login_flutter/models/form/question.dart';

class RangeQuestion extends Question {
  final Question? _nextQuestion;
  final double _initValue;
  final double _startValue;
  final double _endValue;
  const RangeQuestion({required super.id, required super.title, required super.description, required super.imageUrl, required super.isMandatory, nextQuestion, required initValue, required startValue, required endValue}):
        _nextQuestion = nextQuestion, _initValue = initValue, _startValue = startValue, _endValue = endValue;

  Question? get nextQuestion => _nextQuestion;

  bool get hasNextQuestion => _nextQuestion != null;

  @override
  List<Object?> get props => [];

  double get initValue => _initValue;

  double get endValue => _endValue;

  double get startValue => _startValue;

  @override
  String toString() {
    return 'RangeQuestion{_nextQuestion: $_nextQuestion, _initValue: $_initValue, _startValue: $_startValue, _endValue: $_endValue}';
  }
}