// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_attempt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedAttemptResponse _$FinishedAttemptResponseFromJson(
        Map<String, dynamic> json) =>
    FinishedAttemptResponse(
      attempt:
          AttemptResponse.fromJson(json['attempt'] as Map<String, dynamic>),
      responses: (json['responses'] as List<dynamic>)
          .map((e) =>
              FinishedResponseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FinishedAttemptResponseToJson(
        FinishedAttemptResponse instance) =>
    <String, dynamic>{
      'attempt': instance.attempt.toJson(),
      'responses': instance.responses.map((e) => e.toJson()).toList(),
    };
