import 'package:collocation_dictionary/common_widgets/my_border_button1.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ChoiceQuestionWidget> choiceQuestionList = [
  const ChoiceQuestionWidget(
      question: 'Welcome to noun ', choices: ['', '', ''], correctAnswer: ''),
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
      choices: const [
        'คำที่ใช้เรียกคนสัตว์สิ่งของ\nเช่น จอห์น แมว บ้าน',
        'คำที่ใช้เรียกการกระทำ\nเช่น ดู เดิน นั่ง'
      ],
      correctAnswer: 'คำที่ใช้เรียกคนสัตว์สิ่งของ\nเช่น จอห์น แมว บ้าน'),
  ChoiceQuestionWidget(
      imagePath: Assets.images.soy.path,
      question: 'ข้อใดถูก',
      choices: const [
        'เราสามารถจัดประเภทคำนาม  ตามลักษณะที่ สามารถนับได้และนับไม่ได้',
        'เราสามารถจัดประเภทคำนาม  ตามลักษณะที่ มีจำนวนเดียว หรือมีจำนวนมากกว่าหนึ่ง',
        'ถูกทุกข้อ'
      ],
      correctAnswer: 'ถูกทุกข้อ'),
];

class ChoiceQuestionWidget extends ConsumerStatefulWidget {
  const ChoiceQuestionWidget({
    super.key,
    this.widget,
    this.imagePath,
    required this.question,
    required this.choices,
    required this.correctAnswer,
  });
  final Widget? widget;
  final String? imagePath;
  final String question;
  final List<String> choices;
  final String correctAnswer;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChoiceQuestionWidgetState();
}

class _ChoiceQuestionWidgetState extends ConsumerState<ChoiceQuestionWidget> {
  final int selectedChoice = 0;

  @override
  Widget build(BuildContext context) {
    // final selectedAnswer = ref.watch(selectedAnswerProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Column(children: [
              gapH32,
              if (widget.widget != null) widget.widget!,
              if (widget.imagePath != null)
                SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Image.asset(widget.imagePath!)),
              gapH16,
              MyText(widget.question, 29),
              gapH16,
              MyBorderButton1(
                text: widget.choices[0],
              ),
              gapH16,
              MyBorderButton2(
                text: widget.choices[1],
              ),
              gapH16,
              if (widget.choices.length == 3)
                MyBorderButton3(
                  text: widget.choices[2],
                ),
              gapH16,


              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 2,
              //   child: ListView.builder(
              //     itemCount: widget.choices.length,
              //     itemBuilder: (context, index) {
              //       // return widget.choices[index];
              //       return Column(
              //         children: [
              //           MyBorderButton1(text: widget.choices[index]),
              //           const SizedBox(height: 16),
              //         ],
              //       );
              //     },
              //   ),
              // )
            ]),
          ],
        ),
      ),
    );
  }
}
