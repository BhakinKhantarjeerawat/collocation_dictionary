import 'package:flutter/material.dart';

class MyCurveContainer extends StatelessWidget {
  const MyCurveContainer({super.key, required this.child, this.color, this.hPadding = 16});
  final Widget child;
  final Color? color;
  final double hPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade400,
      ),
      // padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
