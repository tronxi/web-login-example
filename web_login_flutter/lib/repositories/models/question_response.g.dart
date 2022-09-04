// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) =>
    QuestionResponse(
      id: json['id'] as int,
      description: json['description'] as String?,
      title: json['title'] as String,
      mandatory: json['mandatory'] as bool,
      imageUrl: json['imageUrl'] as String?,
      questionType: json['questionType'] as String,
      nextQuestion: json['nextQuestion'] == null
          ? null
          : QuestionResponse.fromJson(
              json['nextQuestion'] as Map<String, dynamic>),
      nextQuestionIfTrue: json['nextQuestionIfTrue'] == null
          ? null
          : QuestionResponse.fromJson(
              json['nextQuestionIfTrue'] as Map<String, dynamic>),
      nextQuestionIfFalse: json['nextQuestionIfFalse'] == null
          ? null
          : QuestionResponse.fromJson(
              json['nextQuestionIfFalse'] as Map<String, dynamic>),
      allowMultiple: json['allowMultiple'] as bool?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChoiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultQuestion: json['defaultQuestion'] == null
          ? null
          : QuestionResponse.fromJson(
              json['defaultQuestion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'mandatory': instance.mandatory,
      'questionType': instance.questionType,
      'nextQuestion': instance.nextQuestion?.toJson(),
      'nextQuestionIfTrue': instance.nextQuestionIfTrue?.toJson(),
      'nextQuestionIfFalse': instance.nextQuestionIfFalse?.toJson(),
      'defaultQuestion': instance.defaultQuestion?.toJson(),
      'allowMultiple': instance.allowMultiple,
      'choices': instance.choices?.map((e) => e.toJson()).toList(),
    };
