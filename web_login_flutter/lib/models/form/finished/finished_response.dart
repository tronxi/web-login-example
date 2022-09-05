
import 'package:equatable/equatable.dart';

class FinishedResponse extends Equatable {
  final int _id;
  final String _questionType;
  final String _title;
  final String _description;
  final String _response;

  const FinishedResponse({required id,
    required questionType,
    required title,
    required description,
    required response}):
        _id = id, _questionType = questionType,
        _title = title,
        _description = description,
        _response = response;
  @override
  List<Object?> get props => [_id, _questionType, _title, _description, _response];

  int get id => _id;

  String get response => _response;

  String get description => _description;

  String get title => _title;

  String get questionType => _questionType;

  @override
  String toString() {
    return 'FinishedResponse{_id: $_id, _questionType: $_questionType, _title: $_title, _description: $_description, _response: $_response}';
  }
}