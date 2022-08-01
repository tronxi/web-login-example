import 'package:equatable/equatable.dart';

class UpdatePrivateProfile extends Equatable {
  final String _oldPassword;
  final String _newPassword;

  const UpdatePrivateProfile({required oldPassword, required newPassword}) :
        _oldPassword = oldPassword,
        _newPassword = newPassword;

  String get oldPassword => _oldPassword;
  String get newPassword => _newPassword;

  @override
  List<Object> get props => [_oldPassword, _newPassword];
}