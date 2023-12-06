import 'package:flutter/material.dart';

void openAnimatedDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    transitionBuilder: (context, a1, a2, widget) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: AlertDialog(
            title: const Text("Hi Animation dialog"),
            content: const Text('Nice to meet you'),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      );
    },
  );
}