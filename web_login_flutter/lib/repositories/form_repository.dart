import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:web_login_flutter/repositories/models/form_response.dart';
import 'package:web_login_flutter/shared/http_client.dart';

class Error {}
class Success {
  final FormResponse _response;
  Success({required response}) : _response = response;

  FormResponse get response => _response;
}

class FormRepository {
  Future<Either<Error, Success>> retrieve() async {
    try {
        Dio client = HttpClient().dio;
        final response = await client.get(
            "${HttpClient.baseUrl}forms/");
        FormResponse formResponse = FormResponse.fromJson(response.data);
        return Right(Success(response: formResponse));
    } on DioError {
      return Left(Error());
    }
  }
}