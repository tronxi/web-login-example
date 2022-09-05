import 'package:equatable/equatable.dart';

class Attempt extends Equatable {
  final int _id;
  final int _userId;
  final int _formId;

  const Attempt({required id, required userId, required formId}):
    _id = id, _userId = userId, _formId = formId;


  @override
  List<Object?> get props => [_id, _userId, _formId];

  int get id => _id;

  int get formId => _formId;

  int get userId => _userId;

  @override
  String toString() {
    return 'Attempt{_id: $_id, _userId: $_userId, _formId: $_formId}';
  }
}