import 'package:flutter/material.dart';

class Snackbar {
  static void showInfo(BuildContext context, String message) {
    var snackBar = SnackBar(
        backgroundColor: Colors.cyan,
        behavior: SnackBarBehavior.floating,
        content: Text( message,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showError(BuildContext context, String message) {
    var snackBar = SnackBar(
        backgroundColor: Colors.amber,
        behavior: SnackBarBehavior.floating,
        content: Text( message,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
