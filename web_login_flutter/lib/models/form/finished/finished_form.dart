
import 'package:equatable/equatable.dart';
import 'package:web_login_flutter/models/form/finished/finished_attempt.dart';

class FinishedForm extends Equatable {
  final int _formId;
  final String _formName;
  final String _formDescription;
  final FinishedAttempt _finishedAttempt;

  const FinishedForm({required formId,
    required formName,
    required formDescription,
    required finishedAttempt}):
      _formId = formId,
      _formName = formName,
      _formDescription = formDescription,
      _finishedAttempt = finishedAttempt;

  @override
  List<Object?> get props => [_formId, _formName, _formDescription, _finishedAttempt];

  int get formId => _formId;

  FinishedAttempt get finishedAttempt => _finishedAttempt;

  String get formDescription => _formDescription;

  String get formName => _formName;

  @override
  String toString() {
    return 'FinishedForm{_formId: $_formId, _formName: $_formName, _formDescription: $_formDescription, _finishedAttempt: $_finishedAttempt}';
  }
}