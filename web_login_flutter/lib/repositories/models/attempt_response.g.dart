// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttemptResponse _$AttemptResponseFromJson(Map<String, dynamic> json) =>
    AttemptResponse(
      id: json['id'] as int,
      userId: json['userId'] as int,
      formId: json['formId'] as int,
    );

Map<String, dynamic> _$AttemptResponseToJson(AttemptResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'formId': instance.formId,
    };
