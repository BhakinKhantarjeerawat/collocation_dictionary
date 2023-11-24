import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyStepProgress extends ConsumerWidget {
  const MyStepProgress({super.key, required this.totalSteps, required this.currentStep});
  final int totalSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StepProgressIndicator(
                              totalSteps: totalSteps,
                              currentStep: currentStep,
                              size: 8,
                              padding: 0,
                              selectedColor: Colors.green,
                              unselectedColor: Colors.grey.shade300,
                              roundedEdges: const Radius.circular(10),
                            );
  }
}