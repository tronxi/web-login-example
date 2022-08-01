// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterRequest _$UserRegisterRequestFromJson(Map<String, dynamic> json) =>
    UserRegisterRequest(
      name: json['name'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      surname: json['surname'] as String,
    );

Map<String, dynamic> _$UserRegisterRequestToJson(
        UserRegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'email': instance.email,
      'surname': instance.surname,
    };
