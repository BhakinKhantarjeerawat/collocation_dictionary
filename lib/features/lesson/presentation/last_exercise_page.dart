import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/lesson/presentation/exercises_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastExcercisePage extends ConsumerWidget {
  const LastExcercisePage({super.key, required this.lesson});
  final String lesson;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(lesson, 25),
              gapH8,
              const MyText('คะแนน', 21),
              gapH8,
              MyText(
                  'จำนวนข้อที่ตอบผิด: ${ref.watch(wrongAnswerProvider).length}',
                  20)
            ]),
      ),
    );
  }
}
