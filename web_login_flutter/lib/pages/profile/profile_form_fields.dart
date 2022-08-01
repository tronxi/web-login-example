import 'package:web_login_flutter/widgets/form_fields.dart';
import 'package:flutter/material.dart';

class ProfilePublicFields extends StatelessWidget {
  final TextEditingController _nameController;
  final TextEditingController _surnameController;
  final TextEditingController _emailController;

  const ProfilePublicFields({Key? key, required nameController, required surnameController,
    required emailController}):
        _nameController = nameController,
        _surnameController = surnameController,
        _emailController = emailController,
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
}

class PrivatePublicFields extends StatelessWidget {
  final TextEditingController _oldPasswordController;
  final TextEditingController _newPasswordController;
  final TextEditingController _validatorNewPasswordController;

  const PrivatePublicFields({Key? key, required oldPasswordController, required newPasswordController,
    required validatorNewPasswordController}):
        _oldPasswordController = oldPasswordController,
        _newPasswordController = newPasswordController,
        _validatorNewPasswordController = validatorNewPasswordController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PrincipalPasswordField(
            controller: _oldPasswordController,
            iconData: Icons.password,
            text: "contraseña actual"
        ),
        const SizedBox(height: 10),
        PrincipalPasswordField(
            controller: _newPasswordController,
            validator: (value) => _passwordValidator(value),
            iconData: Icons.password,
            text: "Nueva contraseña"
        ),
        const SizedBox(height: 10),
        PrincipalPasswordField(
            controller: _validatorNewPasswordController,
            iconData: Icons.password,
            text: "Confirmar nueva contraseña"
        ),
      ],
    );
  }

  String? _passwordValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return "La contraseña no puede estar vacía";
    } else if (_validatorNewPasswordController.value.text.isEmpty) {
      return "Debes repetir tu contraseña";
    } else if (_validatorNewPasswordController.value.text != value) {
      return "Las contraseñas deben ser iguales";
    } else {
      return null;
    }
  }
}