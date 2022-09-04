import 'package:json_annotation/json_annotation.dart';
import 'package:web_login_flutter/repositories/models/question_response.dart';

part 'section_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SectionResponse {
  final int id;
  final String name;
  final String? description;
  final int totalQuestions;
  final QuestionResponse questionResponse;

  const SectionResponse({required this.id,
    required this.name,
    required this.description,
    required this.totalQuestions,
    required this.questionResponse});

  factory SectionResponse.fromJson(Map<String, dynamic> json) => _$SectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SectionResponseToJson(this);

  @override
  String toString() {
    return 'SectionResponse{id: $id, name: $name, description: $description, totalQuestions: $totalQuestions, questionResponse: $questionResponse}';
  }
}