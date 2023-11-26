import 'package:flutter/material.dart';

void showSnackBarGlobal(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 50),
      backgroundColor: Colors.orange,
      content: Text(
        message,
        textScaleFactor: 2,
      )));
}
