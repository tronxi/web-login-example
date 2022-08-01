// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_private_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePrivateProfileRequest _$UpdatePrivateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePrivateProfileRequest(
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$UpdatePrivateProfileRequestToJson(
        UpdatePrivateProfileRequest instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
