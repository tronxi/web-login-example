// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChoiceResponse _$ChoiceResponseFromJson(Map<String, dynamic> json) =>
    ChoiceResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      nextQuestion: json['nextQuestion'] == null
          ? null
          : QuestionResponse.fromJson(
              json['nextQuestion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChoiceResponseToJson(ChoiceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nextQuestion': instance.nextQuestion?.toJson(),
    };
