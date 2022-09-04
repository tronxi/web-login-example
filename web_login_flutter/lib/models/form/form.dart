import 'package:equatable/equatable.dart';
import 'package:web_login_flutter/models/form/section.dart';

class FormModel extends Equatable {
  final int _id;
  final String _name;
  final String? _description;
  final int _totalSections;
  final int _totalQuestions;
  final List<Section> _sections;

  const FormModel({required id,
    required name,
    required description,
    required totalSections,
    required totalQuestions,
    required sections}) :
      _id = id,
      _name = name,
      _totalSections = totalSections,
      _totalQuestions = totalQuestions,
      _description = description,
      _sections = sections;


  @override
  List<Object?> get props => [_id, _name, _totalQuestions, _totalQuestions, _description, _sections];

  @override
  String toString() {
    return 'Form{_id: $_id, _name: $_name, _description: $_description, _totalSections: $_totalSections, _totalQuestions: $_totalQuestions, _sections: $_sections}';
  }

  int get id => _id;

  List<Section> get sections => _sections;

  int get totalQuestions => _totalQuestions;

  int get totalSections => _totalSections;

  String? get description => _description;

  String get name => _name;

  bool isLastSection(Section section) {
    int sectionNumber = sections.indexOf(section);

    if(sectionNumber == totalSections - 1) return true;
    return false;
  }

  Section nextSectionTo(Section section) {
    int sectionNumber = sections.indexOf(section);
    return sections[sectionNumber + 1];
  }

  int sectionPosition(Section section) {
    return sections.indexOf(section);
  }
}