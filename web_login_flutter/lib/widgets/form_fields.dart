import 'package:flutter/material.dart';

class PrincipalTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconData iconData;
  final String text;

  const PrincipalTextField({Key? key,
    this.validator,
    required this.controller,
    required this.iconData,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if(validator != null) {
            return validator!(value);
          }else {
            return _defaultValidator(value);
          }
        },
        decoration: InputDecoration(
            icon: Icon(iconData),
            hintText: text
        ),
      ),
    );
  }
  String? _defaultValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return "El campo no puede estar vacío";
    } else {
      return null;
    }
  }
}

class PrincipalPasswordField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconData iconData;
  final String text;

  const PrincipalPasswordField({Key? key,
    this.validator,
    required this.controller,
    required this.iconData,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        obscureText: true,
        controller: controller,
          validator: (value) {
            if(validator != null) {
              return validator!(value);
            }else {
              return _defaultValidator(value);
            }
          },
        decoration: InputDecoration(
            icon: Icon(iconData),
            hintText: text
        ),
      ),
    );
  }
  String? _defaultValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return "El campo no puede estar vacío";
    } else {
      return null;
    }
  }
}
