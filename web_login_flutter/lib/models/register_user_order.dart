import 'package:equatable/equatable.dart';

class RegisterUserOrder extends Equatable {
  final String _email;
  final String _name;
  final String _surname;
  final String _password;

  const RegisterUserOrder({required name, required password, required email, required surname}) :
        _name = name,
        _password = password,
        _email = email,
        _surname = surname;

  String get name => _name;
  String get password => _password;
  String get surname => _surname;
  String get email => _email;

  @override
  List<Object> get props => [_name, _password, _surname, _email];

}
