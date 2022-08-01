import 'package:web_login_flutter/bloc/join_bloc.dart';
import 'package:web_login_flutter/models/register_user_order.dart';
import 'package:web_login_flutter/routes.dart';
import 'package:web_login_flutter/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinFormButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController surnameController;
  final TextEditingController emailController;

  const JoinFormButtons({Key? key, required this.formKey,
    required this.nameController,
    required this.passwordController,
    required this.surnameController,
    required this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PrimaryButton(
            onPressed:() => _onJoinPressed(context.read<JoinBloc>()),
            text: "Registrarse"
        ),
        const SizedBox(height: 10),
        SecondaryButton(
            onPressed: () => _onLoginPressed(context),
            text: "Login"
        )
      ],
    );
  }
  void _onLoginPressed(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.loginPage);
  }

  void _onJoinPressed(JoinBloc joinBloc) {
    if (formKey.currentState?.validate() ?? false) {
      final user = RegisterUserOrder(name: nameController.value.text,
        password: passwordController.value.text,
        email: emailController.value.text,
        surname: surnameController.value.text);
      joinBloc.add(JoinEvent(user: user));
    }
  }
}
