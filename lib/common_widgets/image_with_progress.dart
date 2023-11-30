import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ImageWithProgress extends ConsumerWidget {
  const ImageWithProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return    Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircularPercentIndicator(
              radius: 88.0,
              lineWidth: 9.0,
              percent: 0.7,
              center: Image.asset(Assets.images.treasure.path),
              progressColor: Colors.green,
            ),
          );
  

  }
}