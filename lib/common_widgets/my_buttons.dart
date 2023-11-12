import 'package:flutter/material.dart';

class MyButton21 extends StatelessWidget {
  const MyButton21({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(3), backgroundColor: Colors.amber),
      child: Text(text, style: const TextStyle(fontSize: 21)),
    );
  }
}
