import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/features/new_exercise/choice_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future displayBottomSheet(
  BuildContext context, {
  required String correctAnswer,
  required String selectedAnswer,
  required PageController pageController,
  Widget? nextChapter,
  required WidgetRef ref,
}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: selectedAnswer == correctAnswer
          ? Colors.greenAccent
          : Colors.red.shade400,
      barrierColor: Colors.transparent,
      // isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SizedBox(
            height: 270,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectedAnswer == correctAnswer
                    ? const MyText('ถูก', 29, color: Colors.white)
                    : const MyText('ผิด', 29, color: Colors.white),
                gapH16,
                selectedAnswer == correctAnswer
                    ? const SizedBox()
                    : Column(
                        children: [
                          const MyText('คำตอบที่ถูกคือ', 21,
                              color: Colors.white),
                          MyText(correctAnswer, 18, color: Colors.white),
                        ],
                      ),
                gapH32,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: selectedAnswer == correctAnswer
                      ? ElevatedButton(
                          onPressed: () {
                            ref.read(scoreProvider.notifier).state += 1;
                            if (nextChapter == null) {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                              Navigator.pop(context);
                            } else {
                              myNavigate(context, screen: nextChapter);
                            }
                          },
                          child: const MyText('ถัดไป', 18, color: Colors.green))
                      : ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child:
                              const MyText('ถัดไป', 18, color: Colors.green)),
                ),
                gapH16,
              ],
            )),
          ));
}
