import 'package:json_annotation/json_annotation.dart';

part 'response_request.g.dart';

@JsonSerializable()
class ResponseRequest {
  final String response;

  const ResponseRequest({required this.response});

  factory ResponseRequest.fromJson(Map<String, dynamic> json) => _$ResponseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseRequestToJson(this);

}
