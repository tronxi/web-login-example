import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {
  final String _name;
  final String _password;
  const UserLogin({required name, required password}) : _name = name, _password = password;

  String get name => _name;
  String get password => _password;

  @override
  List<Object> get props => [_name, _password];

}
