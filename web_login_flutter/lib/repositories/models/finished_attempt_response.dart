import 'package:json_annotation/json_annotation.dart';
import 'package:web_login_flutter/repositories/models/attempt_response.dart';

import 'finished_response_response.dart';

part 'finished_attempt_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FinishedAttemptResponse {
  final AttemptResponse attempt;
  final List<FinishedResponseResponse> responses;

  const FinishedAttemptResponse({required this.attempt,
    required this.responses});

  factory FinishedAttemptResponse.fromJson(Map<String, dynamic> json) => _$FinishedAttemptResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FinishedAttemptResponseToJson(this);

}