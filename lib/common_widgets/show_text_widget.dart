import 'package:flutter/material.dart';

class ShowTextWidget extends StatelessWidget {
  const ShowTextWidget({super.key, required this.text, required this.width});
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Align(
          alignment: Alignment.center,
          child: Text(text,
              style: const TextStyle(fontSize: 18, color: Colors.blue))),
    );
  }
}
