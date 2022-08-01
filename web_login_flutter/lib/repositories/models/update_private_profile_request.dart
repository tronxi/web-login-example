import 'package:json_annotation/json_annotation.dart';

part 'update_private_profile_request.g.dart';

@JsonSerializable()
class UpdatePrivateProfileRequest {
  final String oldPassword;
  final String newPassword;

  const UpdatePrivateProfileRequest({required this.oldPassword, required this.newPassword});

  factory UpdatePrivateProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdatePrivateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePrivateProfileRequestToJson(this);

}
