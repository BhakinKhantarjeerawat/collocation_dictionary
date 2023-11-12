import 'package:flutter/material.dart';

class MyText21 extends StatelessWidget {
  const MyText21({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(3)
          // Background color
          ),
      child: Text(text, style: const TextStyle(fontSize: 21)),
    );
  }
}

class MyText27 extends StatelessWidget {
  const MyText27({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(3)
          // Background color
          ),
      child: Text(text, style: const TextStyle(fontSize: 27)),
    );
  }
}
