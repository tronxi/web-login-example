import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpClient {
  static String? token;
  late final Dio _dio;
  static String baseUrl = "https://tronxi.ddns.net/web-login/";

  HttpClient._() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (token != null) {
          options.headers['authorization'] = "Bearer $token!";
        }
        return handler.next(options);
      },
    ));
  }

  static final HttpClient _instance = HttpClient._();

  factory HttpClient() {
    return _instance;
  }

  Dio get dio => _dio;
}
