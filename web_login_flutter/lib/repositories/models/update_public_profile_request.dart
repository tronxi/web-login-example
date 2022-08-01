import 'package:json_annotation/json_annotation.dart';

part 'update_public_profile_request.g.dart';

@JsonSerializable()
class UpdatePublicProfileRequest {
  final String name;
  final String email;
  final String surname;

  const UpdatePublicProfileRequest({required this.name, required this.email, required this.surname});

  factory UpdatePublicProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdatePublicProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePublicProfileRequestToJson(this);

}
