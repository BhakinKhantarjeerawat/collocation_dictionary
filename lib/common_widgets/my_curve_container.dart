import 'package:flutter/material.dart';

class MyCurveContainer extends StatelessWidget {
  const MyCurveContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade100,
      ),
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
