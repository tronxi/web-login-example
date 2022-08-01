import 'package:web_login_flutter/models/register_user_order.dart';
import 'package:web_login_flutter/shared/http_client.dart';
import 'package:web_login_flutter/repositories/models/user_register_request.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class Error {}
class Success {}

class JoinRepository {
  Future<Either<Error, Success>> register(RegisterUserOrder user) async {
    try {
      Dio client = HttpClient().dio;
      final userLoginRequest = UserRegisterRequest(
          name: user.name, password: user.password, email: user.email, surname: user.surname);
      await client.post(
          "${HttpClient.baseUrl}users", data: userLoginRequest.toJson());
      return Right(Success());
    } on DioError {
      return Left(Error());
    }
  }
}
