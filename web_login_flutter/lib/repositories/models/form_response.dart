import 'package:json_annotation/json_annotation.dart';

import 'section_response.dart';

part 'form_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FormResponse {
  final int id;
  final String name;
  final String? description;
  final int totalSections;
  final int totalQuestions;
  final List<SectionResponse> sectionResponses;

  const FormResponse({required this.id,
    required this.name,
    required this.description,
    required this.totalSections,
    required this.totalQuestions,
    required this.sectionResponses});

  factory FormResponse.fromJson(Map<String, dynamic> json) => _$FormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FormResponseToJson(this);

  @override
  String toString() {
    return 'FormResponse{id: $id, name: $name, description: $description, totalSections: $totalSections, totalQuestions: $totalQuestions, sectionResponses: $sectionResponses}';
  }
}