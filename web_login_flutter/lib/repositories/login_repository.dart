import 'package:web_login_flutter/models/user_login.dart';
import 'package:web_login_flutter/repositories/models/login_response.dart';
import 'package:web_login_flutter/shared/http_client.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'dart:convert';


class Error {}
class Success {
  final String _token;
  Success({token}) : _token = token;
  String get token => _token;
}

class LoginRepository {
  Future<Either<Error, Success>> login(UserLogin userLogin) async {
    try {
      Dio client = HttpClient().dio;
      final response = await client.post(
          "${HttpClient.baseUrl}login",
          options: Options(headers: <String, String>{'authorization': _generateHeader(userLogin)}));
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      return Right(Success(token: loginResponse.token));
    } on DioError {
      return Left(Error());
    }
  }

  String _generateHeader(UserLogin userLogin) {
    return 'Basic ${base64Encode(utf8.encode('${userLogin.name}:${userLogin.password}'))}';
  }
}
