import 'package:json_annotation/json_annotation.dart';

part 'finished_response_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FinishedResponseResponse {
  final int id;
  final String questionType;
  final String title;
  final String description;
  final String response;

  const FinishedResponseResponse({required this.id,
    required this.questionType,
    required this.title,
    required this.description,
    required this.response});

  factory FinishedResponseResponse.fromJson(Map<String, dynamic> json) => _$FinishedResponseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FinishedResponseResponseToJson(this);

}