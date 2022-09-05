import 'package:json_annotation/json_annotation.dart';
import 'package:web_login_flutter/repositories/models/finished_attempt_response.dart';


part 'finished_form_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FinishedFormResponse {
  final int formId;
  final String formName;
  final String formDescription;
  final FinishedAttemptResponse finishedAttempts;

  const FinishedFormResponse({required this.formId,
    required this.formName,
    required this.formDescription,
    required this.finishedAttempts});

  factory FinishedFormResponse.fromJson(Map<String, dynamic> json) => _$FinishedFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FinishedFormResponseToJson(this);
}