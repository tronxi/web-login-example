
import 'package:equatable/equatable.dart';
import 'package:web_login_flutter/models/form/attempt.dart';
import 'package:web_login_flutter/models/form/finished/finished_response.dart';

class FinishedAttempt extends Equatable {

  final Attempt _attempt;
  final List<FinishedResponse> _responses;

  const FinishedAttempt({required attempt,
    required responses}):
      _attempt = attempt, _responses = responses;

  @override
  List<Object?> get props => [_attempt, _responses];

  Attempt get attempt => _attempt;

  List<FinishedResponse> get responses => _responses;

  @override
  String toString() {
    return 'FinishedAttempt{_attempt: $_attempt, _responses: $_responses}';
  }
}