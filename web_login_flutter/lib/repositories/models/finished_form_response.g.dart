// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedFormResponse _$FinishedFormResponseFromJson(
        Map<String, dynamic> json) =>
    FinishedFormResponse(
      formId: json['formId'] as int,
      formName: json['formName'] as String,
      formDescription: json['formDescription'] as String,
      finishedAttempts: FinishedAttemptResponse.fromJson(
          json['finishedAttempts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FinishedFormResponseToJson(
        FinishedFormResponse instance) =>
    <String, dynamic>{
      'formId': instance.formId,
      'formName': instance.formName,
      'formDescription': instance.formDescription,
      'finishedAttempts': instance.finishedAttempts.toJson(),
    };
