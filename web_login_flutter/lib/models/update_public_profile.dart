import 'package:equatable/equatable.dart';

class UpdatePublicProfile extends Equatable {
  final String _email;
  final String _name;
  final String _surname;

  const UpdatePublicProfile({required name, required email, required surname}) :
        _name = name,
        _email = email,
        _surname = surname;

  String get name => _name;
  String get surname => _surname;
  String get email => _email;

  @override
  List<Object> get props => [_name, _surname, _email];
}