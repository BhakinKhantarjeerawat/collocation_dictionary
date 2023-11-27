import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.text,
    this.size, {
    super.key,
  });
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size),
      textAlign: TextAlign.center,
    );
  }
}
