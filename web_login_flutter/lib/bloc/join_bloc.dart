import 'package:web_login_flutter/models/register_user_order.dart';
import 'package:web_login_flutter/repositories/join_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinEvent {
  final RegisterUserOrder _user;
  JoinEvent({user}) : _user = user;

  RegisterUserOrder get user => _user;
}
abstract class JoinState {}
class JoinInitial extends JoinState {}
class JoinSuccess extends JoinState {}
class JoinFailure extends JoinState {}

class JoinBloc extends Bloc<JoinEvent, JoinState> {
  late final JoinRepository _joinRepository;

  JoinBloc() : super(JoinInitial()) {
    _joinRepository = JoinRepository();
    on<JoinEvent>((event, emit) async => emit(await _onJoinEvent(event.user)));
  }

  Future<JoinState> _onJoinEvent(RegisterUserOrder user) async {
    final response = await _joinRepository.register(user);
    return response.fold((left) => JoinFailure(), (right) => JoinSuccess());
  }

}
