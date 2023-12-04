import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class MyLiquidLinearProgress extends StatelessWidget {
  const MyLiquidLinearProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 9,
      child: LiquidLinearProgressIndicator(
        value: 0.7, // Defaults to 0.5.
        valueColor: const AlwaysStoppedAnimation(Color.fromARGB(255, 153, 184,
            237)), // Defaults to the current Theme's accentColor.
        backgroundColor:
            Colors.white, // Defaults to the current Theme's backgroundColor.
        borderColor: Colors.transparent,
        borderWidth: 5.0,
        borderRadius: 12.0,
        direction: Axis
            .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
        center: const Text("Loading..."),
      ),
    );
  }
}

class MyLiquidCircularProgress extends StatelessWidget {
  const MyLiquidCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 9,
        child: LiquidCircularProgressIndicator(
          value: 0.25, // Defaults to 0.5.
          valueColor: const AlwaysStoppedAnimation(Colors
              .blueAccent), // Defaults to the current Theme's accentColor.
          backgroundColor:
              Colors.white, // Defaults to the current Theme's backgroundColor.
          borderColor: Colors.transparent,
          borderWidth: 5.0,
          direction: Axis
              .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
          center: const Text("hardcoded"),
        ));
  }
}



// Path _buildBoatPath() {
//   return Path()
//     ..moveTo(15, 120)
//     ..lineTo(0, 85)
//     ..lineTo(50, 85)
//     ..lineTo(50, 0)
//     ..lineTo(105, 80)
//     ..lineTo(60, 80)
//     ..lineTo(60, 85)
//     ..lineTo(120, 85)
//     ..lineTo(105, 120)
//     ..close();
// }

// final double width = 550;
// final double height = 250;

// Path _buildMountainPath() {
//   return Path()
//     ..moveTo(width * 0.2950000, height * 0.4985714)
//     ..lineTo(width * 0.3350000, height * 0.3557143)
//     ..lineTo(width * 0.3766667, height * 0.2885714)
//     ..lineTo(width * 0.4158333, height * 0.2214286)
//     ..lineTo(width * 0.4600000, height * 0.2842857)
//     ..lineTo(width * 0.4966667, height * 0.3642857)
//     ..lineTo(width * 0.5425000, height * 0.4300000)
//     ..lineTo(width * 0.5825000, height * 0.4271429)
//     ..lineTo(width * 0.6208333, height * 0.3571429)
//     ..lineTo(width * 0.6683333, height * 0.4328571)
//     ..lineTo(width * 0.7083333, height * 0.4285714)
//     ..lineTo(width * 0.7358333, height * 0.5000000)
//     ..lineTo(width * 0.2950000, height * 0.4985714)
//     ..close();
// }

// Path _buildMyFriend() {
//   return
// Path()
//     ..moveTo(33.0796,342.434)
//     ..cubicTo(137.846,167.407,-11.1908,151.491,31.5446,38.6844)
//     ..cubicTo(83.8181,-68.0928,299.24,70.9259,364.855,193.387)
//     ..cubicTo(441.41,336.263,257.659,513.552,156.953,529.559)
//     ..cubicTo(56.2469,545.566,-56.7526,488.887,33.0796,342.434)
//     ..close();}
