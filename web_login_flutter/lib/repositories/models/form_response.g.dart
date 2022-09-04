// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormResponse _$FormResponseFromJson(Map<String, dynamic> json) => FormResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      totalSections: json['totalSections'] as int,
      totalQuestions: json['totalQuestions'] as int,
      sectionResponses: (json['sectionResponses'] as List<dynamic>)
          .map((e) => SectionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FormResponseToJson(FormResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'totalSections': instance.totalSections,
      'totalQuestions': instance.totalQuestions,
      'sectionResponses':
          instance.sectionResponses.map((e) => e.toJson()).toList(),
    };
