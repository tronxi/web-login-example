import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:web_login_flutter/repositories/models/attempt_response.dart';
import 'package:web_login_flutter/repositories/models/response_request.dart';
import 'package:web_login_flutter/shared/http_client.dart';

class Error {}

class Success {
  final AttemptResponse _response;
  Success({required response}) : _response = response;

  AttemptResponse get response => _response;
}

class EmptySuccess {}

class AttemptRepository {
  Future<Either<Error, Success>> create(String userId, int formId) async {
    try {
      Dio client = HttpClient().dio;
      final response = await client.post(
          "${HttpClient.baseUrl}attempts/users/$userId/forms/${formId.toString()}");
      AttemptResponse formResponse = AttemptResponse.fromJson(response.data);
      return Right(Success(response: formResponse));
    } on DioError {
      return Left(Error());
    }
  }

  Future<Either<Error, Success>> finish(int attemptId) async {
    try {
      Dio client = HttpClient().dio;
      final response = await client
          .put("${HttpClient.baseUrl}attempts/${attemptId.toString()}/finish");
      AttemptResponse formResponse = AttemptResponse.fromJson(response.data);
      return Right(Success(response: formResponse));
    } on DioError {
      return Left(Error());
    }
  }

  Future<Either<Error, EmptySuccess>> response(int attemptId, int questionId, String response) async {
    try {
      Dio client = HttpClient().dio;
      await client
          .post("${HttpClient.baseUrl}responses/attempts/${attemptId.toString()}/questions/${questionId.toString()}", data: ResponseRequest(response: response).toJson());
      return Right(EmptySuccess());
    } on DioError {
      return Left(Error());
    }
  }

  Future<Either<Error, EmptySuccess>> deleteResponse(int attemptId, int questionId) async {
    try {
      Dio client = HttpClient().dio;
      await client
          .delete("${HttpClient.baseUrl}responses/attempts/${attemptId.toString()}/questions/${questionId.toString()}");
      return Right(EmptySuccess());
    } on DioError {
      return Left(Error());
    }
  }
}
