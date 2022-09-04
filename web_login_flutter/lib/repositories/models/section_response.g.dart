// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionResponse _$SectionResponseFromJson(Map<String, dynamic> json) =>
    SectionResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      totalQuestions: json['totalQuestions'] as int,
      questionResponse: QuestionResponse.fromJson(
          json['questionResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SectionResponseToJson(SectionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'totalQuestions': instance.totalQuestions,
      'questionResponse': instance.questionResponse.toJson(),
    };
