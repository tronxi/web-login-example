import 'package:json_annotation/json_annotation.dart';

part 'attempt_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AttemptResponse {
  final int id;
  final int userId;
  final int formId;

  const AttemptResponse({required this.id,
    required this.userId,
    required this.formId});

  factory AttemptResponse.fromJson(Map<String, dynamic> json) => _$AttemptResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AttemptResponseToJson(this);

}