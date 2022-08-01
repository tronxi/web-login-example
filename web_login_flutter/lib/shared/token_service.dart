import 'package:jwt_decode/jwt_decode.dart';
import 'package:web_login_flutter/shared/http_client.dart';

class TokenService {
  late String? _token;

  TokenService._() {
    _token = null;
  }

  static final TokenService _instance = TokenService._();

  factory TokenService() {
    return _instance;
  }

  void save(String token) {
    _token = token;
    HttpClient.token = token;
  }

  String? retrieve() {
    return _token;
  }

  void destroy() {
    _token = null;
    HttpClient.token = null;
  }

  String? retrieveUserId() {
    if(_token != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(_token!);
      return "${payload["id"]}";
    } else {
      return null;
    }
  }

}
