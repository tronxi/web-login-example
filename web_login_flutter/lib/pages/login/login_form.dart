import 'package:web_login_flutter/pages/login/login_forms_buttons.dart';
import 'package:flutter/material.dart';
import 'package:web_login_flutter/widgets/login_data_fields.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  LoginDataFields(
                      nameController: _nameController,
                      passwordController: _passwordController
                  ),
                  const SizedBox(height: 50),
                  LoginFormButtons(
                      formKey: _key,
                      nameController: _nameController,
                      passwordController: _passwordController,
                  )
                ],
              )
          ),
        )
    );
  }
}



