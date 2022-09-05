import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:web_login_flutter/repositories/models/finished_form_response.dart';
import 'package:web_login_flutter/shared/http_client.dart';

class Error {}
class Success {
  late final List<FinishedFormResponse> _finishedFormResponse;
  Success({required response}) : _finishedFormResponse = response;
  List<FinishedFormResponse> get response => _finishedFormResponse;
}

class FinishedFormRepository {
  Future<Either<Error, Success>> retrieve(String userId) async {
    try {
      Dio client = HttpClient().dio;
      final response = await client.get(
          "${HttpClient.baseUrl}attempts/users/$userId/finished");
      List<FinishedFormResponse> formResponse = (response.data as List)
          .map((e) => FinishedFormResponse.fromJson(e))
          .toList();
      return Right(Success(response: formResponse));
    } on DioError {
      return Left(Error());
    }
  }
}