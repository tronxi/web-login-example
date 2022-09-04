import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const PrimaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(fontSize: 25),
            )));
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const SecondaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 50,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(fontSize: 25),
            )));
  }
}

class IconLabelButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const IconLabelButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 50,
        child: TextButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.logout, size: 26.0, color: Colors.black),
            label: Text(
              text,
              style: const TextStyle(fontSize: 25, color: Colors.black),
            )));
  }
}

class FormButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isDisabled;
  const FormButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.isDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 30,
        child: ElevatedButton(
            onPressed: isDisabled ? null : onPressed,
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            )));
  }
}
