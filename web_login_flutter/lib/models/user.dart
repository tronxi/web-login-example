import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String _email;
  final String _name;
  final String _surname;
  final String _id;
  const User({required id, required name, required email, required surname}) :
        _id = id,
        _name = name,
        _email = email,
        _surname = surname;

  String get name => _name;
  String get id => _id;
  String get surname => _surname;
  String get email => _email;

  @override
  List<Object> get props => [_name, _id, _surname, _email];

}
