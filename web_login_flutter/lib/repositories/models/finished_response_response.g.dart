// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_response_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedResponseResponse _$FinishedResponseResponseFromJson(
        Map<String, dynamic> json) =>
    FinishedResponseResponse(
      id: json['id'] as int,
      questionType: json['questionType'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      response: json['response'] as String,
    );

Map<String, dynamic> _$FinishedResponseResponseToJson(
        FinishedResponseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionType': instance.questionType,
      'title': instance.title,
      'description': instance.description,
      'response': instance.response,
    };
