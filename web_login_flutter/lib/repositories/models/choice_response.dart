import 'package:json_annotation/json_annotation.dart';
import 'package:web_login_flutter/repositories/models/question_response.dart';

part 'choice_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ChoiceResponse {
  final int id;
  final String name;
  final QuestionResponse? nextQuestion;

  const ChoiceResponse({required this.id,
    required this.name,
    required this.nextQuestion});

  factory ChoiceResponse.fromJson(Map<String, dynamic> json) => _$ChoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceResponseToJson(this);

  @override
  String toString() {
    return 'ChoiceResponse{id: $id, name: $name, nextQuestion: $nextQuestion}';
  }
}