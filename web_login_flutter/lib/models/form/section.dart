import 'package:equatable/equatable.dart';
import 'package:web_login_flutter/models/form/question.dart';

class Section extends Equatable {
  final int _id;
  final String _name;
  final String? _description;
  final int _totalQuestions;
  final Question _question;

  const Section({required id,
    required name,
    required description,
    required totalQuestions,
    required question}) :
        _id = id,
        _name = name,
        _totalQuestions = totalQuestions,
        _description = description,
        _question = question;


  @override
  List<Object?> get props => [_id, _name, _totalQuestions, _description, _question];

  @override
  String toString() {
    return 'Section{_id: $_id, _name: $_name, _description: $_description, _totalQuestions: $_totalQuestions, _question: $_question}';
  }

  int get id => _id;

  Question get question => _question;

  int get totalQuestions => _totalQuestions;

  String? get description => _description;

  String get name => _name;
}