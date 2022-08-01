import 'package:web_login_flutter/models/user_login.dart';
import 'package:web_login_flutter/repositories/login_repository.dart';
import 'package:web_login_flutter/shared/token_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEvent {
  final UserLogin _user;
  LoginEvent({user}) : _user = user;

  UserLogin get user => _user;
}

abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final LoginRepository loginRepository;

  LoginBloc() : super(LoginInitial()) {
    loginRepository = LoginRepository();
    on<LoginEvent>((event, emit) async => emit(await _onJoinEvent(event.user)));
  }

  Future<LoginState> _onJoinEvent(UserLogin user) async {
    final response = await loginRepository.login(user);
    return response.fold((left) => LoginFailure(), (right) => _generateLoginSuccess(right));
  }

  Future<LoginSuccess> _generateLoginSuccess(Success success) async {
    TokenService().save(success.token);
    return LoginSuccess();
  }

}
