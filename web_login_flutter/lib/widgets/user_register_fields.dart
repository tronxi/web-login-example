import 'package:web_login_flutter/widgets/form_fields.dart';
import 'package:flutter/material.dart';


class UserRegisterFields extends StatelessWidget {
  final TextEditingController _nameController;
  final TextEditingController _surnameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _validationPasswordController;

  const UserRegisterFields({Key? key, required nameController,
    required passwordController, required surnameController,
    required emailController, required validationPasswordController}):
        _nameController = nameController,
        _surnameController = surnameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _validationPasswordController = validationPasswordController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PrincipalTextField(
            controller: _emailController,
            validator: _emailValidator,
            iconData: Icons.mail,
            text: "correo"
        ),
        const SizedBox(height: 10),
        PrincipalTextField(
            controller: _nameController,
            iconData: Icons.person,
            text: "Nombre"
        ),
        const SizedBox(height: 10),
        PrincipalTextField(
            controller: _surnameController,
            iconData: Icons.person,
            text: "Apellidos"
        ),
        const SizedBox(height: 10),
        PrincipalPasswordField(
            controller: _passwordController,
            validator: (value) => _passwordValidator(value),
            iconData: Icons.password,
            text: "Contraseña"
        ),
        const SizedBox(height: 10),
        PrincipalPasswordField(
            controller: _validationPasswordController,
            iconData: Icons.password,
            text: "Confirmar contraseña"
        ),
      ],
    );
  }

  String? _emailValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return "El email no puede estar vacío";
    } else if(_isNotValidEmail(value!)) {
      return "El email es invalido";
    } else {
      return null;
    }
  }

  bool _isNotValidEmail(String email) {
    return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  String? _passwordValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return "La contraseña no puede estar vacía";
    } else if (_validationPasswordController.value.text.isEmpty) {
      return "Debes repetir tu contraseña";
    } else if (_validationPasswordController.value.text != value) {
      return "Las contraseñas deben ser iguales";
    } else {
      return null;
    }
  }
}
