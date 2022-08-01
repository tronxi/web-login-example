import 'package:json_annotation/json_annotation.dart';

part 'user_register_request.g.dart';

@JsonSerializable()
class UserRegisterRequest {
  final String name;
  final String password;
  final String email;
  final String surname;

  const UserRegisterRequest({required this.name, required this.password, required this.email, required this.surname});

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) => _$UserRegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterRequestToJson(this);

}
