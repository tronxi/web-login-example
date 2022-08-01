import 'package:web_login_flutter/pages/join/join_forms_buttons.dart';
import 'package:web_login_flutter/widgets/user_register_fields.dart';
import 'package:flutter/material.dart';

class JoinForm extends StatelessWidget {
  JoinForm({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _validationPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: SizedBox(
          height: double.infinity,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 UserRegisterFields(
                   emailController: _emailController,
                   nameController: _nameController,
                   surnameController: _surnameController,
                   passwordController: _passwordController,
                   validationPasswordController: _validationPasswordController
                 ),
                  const SizedBox(height: 50),
                  JoinFormButtons(
                    formKey: _key,
                    nameController: _nameController,
                    passwordController: _passwordController,
                    emailController: _emailController,
                    surnameController: _surnameController,
                  )
                ],
              )
          ),
        )
    );
  }
}
