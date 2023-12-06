import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/common_widgets/open_animated_dialog.dart';
import 'package:flutter/material.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';

Future displayBottomSheet(BuildContext context, int correctAnswer,
    int selectedAnswer, String correctedText) {
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
                          MyText(correctedText, 18, color: Colors.white),
                        ],
                      ),
                gapH32,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: ElevatedButton(
                      onPressed: selectedAnswer == correctAnswer
                          ? () {
                              openAnimatedDialog(context);
                            }
                          : null,
                      child: MyText('ถัดไป', 18,
                          color: selectedAnswer == correctAnswer
                              ? Colors.green
                              : Colors.white)),
                ),
                gapH16,
              ],
            )),
          ));
}
