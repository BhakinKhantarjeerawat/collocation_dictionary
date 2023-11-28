import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.text,
    this.size,
    
     {
      this.color,
    super.key,
  });
  final String text;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
      textAlign: TextAlign.center,
    );
  }
}
