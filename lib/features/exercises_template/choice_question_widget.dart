import 'package:collocation_dictionary/common_widgets/display_bottom_sheet.dart';
import 'package:collocation_dictionary/common_widgets/gradient_button.dart';
import 'package:collocation_dictionary/common_widgets/my_border_button1.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ChoiceQuestionWidget> choiceQuestionList = [
  ChoiceQuestionWidget(
      widget: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Tooltip(
            message: 'home|โฮม|บ้าน',
            child: SizedBox(
                width: 100, child: Image.asset(Assets.images.home.path))),
        const MyText('เทียบกับ', 21),
        Tooltip(
            message: 'walk|วอล์ค|เดิน',
            child: SizedBox(
                width: 100, child: Image.asset(Assets.images.walk.path))),
      ]),
      question: 'คำนามคือ',
      firstChoice: 'คำที่ใช้เรียกคนสัตว์สิ่งของ\nเช่น จอห์น แมว บ้าน',
      secondChoice: 'คำที่ใช้เรียกการกระทำ\nเช่น ดู เดิน นั่ง',
      correctAnswer: 1),
  ChoiceQuestionWidget(
      imagePath: Assets.images.soy.path,
      question: 'ข้อใดถูก',
      firstChoice:
          'เราสามารถจัดประเภทคำนาม  ตามลักษณะที่ สามารถนับได้และนับไม่ได้',
      secondChoice:
          'เราสามารถจัดประเภทคำนาม  ตามลักษณะที่ มีจำนวนเดียว หรือมีจำนวนมากกว่าหนึ่ง',
      thirdChoice: 'ถูกทุกข้อ',
      correctAnswer: 3),
];

class ChoiceQuestionWidget extends ConsumerStatefulWidget {
  const ChoiceQuestionWidget({
    super.key,
    this.widget,
    this.imagePath,
    required this.question,
    required this.firstChoice,
    required this.secondChoice,
    this.thirdChoice,
    required this.correctAnswer,
  });
  final Widget? widget;
  final String? imagePath;
  final String question;
  final String firstChoice;
  final String secondChoice;
  final String? thirdChoice;
  final int correctAnswer;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChoiceQuestionWidgetState();
}

class _ChoiceQuestionWidgetState extends ConsumerState<ChoiceQuestionWidget> {
  final int selectedChoice = 0;

  String myCorrectText(int correctChoice) {
    switch (correctChoice) {
      case 1:
        return widget.firstChoice;
      case 2:
        return widget.secondChoice;
      case 3:
        return widget.thirdChoice!;
      default:
        return 'correcText function error, out of index';
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedAnswer = ref.watch(selectedAnswerProvider);
    return Scaffold(
      floatingActionButton: GradientButtonFb4(
          text: 'ตรวจคำตอบ',
          onPressed: () {
            displayBottomSheet(context, widget.correctAnswer, selectedAnswer,
                myCorrectText(widget.correctAnswer));
          }),
      body: Stack(
        children: [
          // Image.asset(Assets.images.light.path,
          //     height: double.infinity, fit: BoxFit.cover),
          Center(
            child: Column(children: [
              gapH48,
              if (widget.widget != null) widget.widget!,
              if (widget.imagePath != null) Image.asset(widget.imagePath!),
              gapH32,
              MyText(widget.question, 29),
              gapH32,
              MyBorderButton1(
                text: widget.firstChoice,
              ),
              gapH16,
              MyBorderButton2(
                text: widget.secondChoice,
              ),
              gapH16,
              if (widget.thirdChoice != null)
                MyBorderButton3(
                  text: widget.thirdChoice!,
                ),
              gapH16,
            ]),
          ),
        ],
      ),
    );
  }
}
