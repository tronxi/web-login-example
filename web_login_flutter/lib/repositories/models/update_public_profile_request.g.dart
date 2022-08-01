// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_public_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePublicProfileRequest _$UpdatePublicProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePublicProfileRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      surname: json['surname'] as String,
    );

Map<String, dynamic> _$UpdatePublicProfileRequestToJson(
        UpdatePublicProfileRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'surname': instance.surname,
    };
