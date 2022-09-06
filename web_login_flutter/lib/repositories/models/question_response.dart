import 'package:json_annotation/json_annotation.dart';

import 'choice_response.dart';

part 'question_response.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionResponse {
  final int id;
  final String title;
  final String? description;
  final String? imageUrl;
  final bool mandatory;
  final String questionType;
  final double? startValue;
  final double? endValue;
  final double? initValue;
  final QuestionResponse? nextQuestion;
  final QuestionResponse? nextQuestionIfTrue;
  final QuestionResponse? nextQuestionIfFalse;
  final QuestionResponse? defaultQuestion;
  final bool? allowMultiple;
  final List<ChoiceResponse>? choices;

  const QuestionResponse({required this.id,
    required this.description,
    required this.title,
    required this.mandatory,
    required this.imageUrl,
    required this.questionType,
    required this.nextQuestion,
    required this.nextQuestionIfTrue,
    required this.nextQuestionIfFalse,
    required this.allowMultiple,
    required this.choices,
    required this.defaultQuestion,
    required this.startValue,
    required this.endValue,
    required this.initValue});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) => _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);

  @override
  String toString() {
    return 'QuestionResponse{id: $id, title: $title, description: $description, imageUrl: $imageUrl, mandatory: $mandatory, questionType: $questionType, startValue: $startValue, endValue: $endValue, initValue: $initValue, nextQuestion: $nextQuestion, nextQuestionIfTrue: $nextQuestionIfTrue, nextQuestionIfFalse: $nextQuestionIfFalse, defaultQuestion: $defaultQuestion, allowMultiple: $allowMultiple, choices: $choices}';
  }
}