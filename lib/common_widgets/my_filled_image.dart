import 'package:flutter/material.dart';

class MyFilledImage extends StatelessWidget {
  const MyFilledImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            imagePath,
            // fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}