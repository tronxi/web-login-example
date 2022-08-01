import 'package:web_login_flutter/repositories/models/update_private_profile_request.dart';
import 'package:web_login_flutter/repositories/models/update_public_profile_request.dart';
import 'package:web_login_flutter/repositories/models/user_response.dart';
import 'package:web_login_flutter/shared/http_client.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
class Error {}
class Success {
  final UserResponse _user;
  Success({required userResponse}) : _user = userResponse;

  UserResponse get userResponse => _user;
}

class ProfileRepository {
  Future<Either<Error, Success>> retrieve(String userId) async {
    try {
      Dio client = HttpClient().dio;
      final response = await client.get(
          "${HttpClient.baseUrl}users/$userId");
      UserResponse userResponse = UserResponse.fromJson(response.data);
      return Right(Success(userResponse: userResponse));
    } on DioError {
      return Left(Error());
    }
  }

  Future<Either<Error, Success>> updatePublicProfile(String userId, UpdatePublicProfileRequest updatePublicProfileRequest) async {
    try {
      Dio client = HttpClient().dio;
      final response = await client.put(
          "${HttpClient.baseUrl}users/$userId/public", data: updatePublicProfileRequest.toJson());
      UserResponse userResponse = UserResponse.fromJson(response.data);
      return Right(Success(userResponse: userResponse));
    } on DioError {
      return Left(Error());
    }
  }


  Future<Either<Error, Success>> updatePrivateProfile(String userId, UpdatePrivateProfileRequest updatePrivateProfileRequest) async {
    try {
      Dio client = HttpClient().dio;
      final response = await client.put(
          "${HttpClient.baseUrl}users/$userId/private", data: updatePrivateProfileRequest.toJson());
      UserResponse userResponse = UserResponse.fromJson(response.data);
      return Right(Success(userResponse: userResponse));
    } on DioError {
      return Left(Error());
    }
  }
}