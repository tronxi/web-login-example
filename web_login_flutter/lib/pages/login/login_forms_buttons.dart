import 'package:web_login_flutter/bloc/login_bloc.dart';
import 'package:web_login_flutter/models/user_login.dart';
import 'package:web_login_flutter/routes.dart';
import 'package:web_login_flutter/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  const LoginFormButtons({Key? key, required this.formKey, required this.nameController, required this.passwordController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PrimaryButton(
            onPressed: () => _onLoginPressed(context.read<LoginBloc>()),
            text: "Login"
        ),
        const SizedBox(height: 10),
        SecondaryButton(
            onPressed: () => _onJoinPressed(context),
            text: "Registro"
        )
      ],
    );
  }
  void _onLoginPressed(LoginBloc loginBloc) {
    if (formKey.currentState?.validate() ?? false) {
      final user = UserLogin(name: nameController.value.text, password: passwordController.value.text);
      loginBloc.add(LoginEvent(user: user));
    }
  }

  void _onJoinPressed(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.joinPage);
  }
}
