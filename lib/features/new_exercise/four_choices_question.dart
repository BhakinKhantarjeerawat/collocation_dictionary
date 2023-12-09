import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/new_exercise/choice_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FourChoicesQuestion extends ConsumerStatefulWidget {
  const FourChoicesQuestion(
      {super.key,
      required this.question,
      required this.correctAnswer,
      required this.choices,
      required this.imagePath});
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final List<String> imagePath;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FourChoicesQuestionState();
}

class _FourChoicesQuestionState extends ConsumerState<FourChoicesQuestion> {
  // int selectedAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.grey.shade200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(widget.question, 36),
              gapH32,
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                FourAnswerItem1(
                  imagePath: widget.imagePath[0],
                  text: widget.choices[0],
                  onTap: () {
                    ref.read(selectedAnswer1.notifier).state = 1;
                  },
                ),
                FourAnswerItem2(
                  imagePath: widget.imagePath[1],
                  text: widget.choices[1],
                  onTap: () {
                    ref.read(selectedAnswer1.notifier).state = 2;
                  },
                ),
              ]),
              gapH32,
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                FourAnswerItem3(
                  imagePath: widget.imagePath[2],
                  text: widget.choices[2],
                  onTap: () {
                    ref.read(selectedAnswer1.notifier).state = 3;
                  },
                ),
                FourAnswerItem4(
                  imagePath: widget.imagePath[3],
                  text: widget.choices[3],
                  onTap: () {
                    ref.read(selectedAnswer1.notifier).state = 4;
                  },
                ),
              ]),
            ]),
      ),
    ));
  }
}

class FourAnswerItem1 extends ConsumerWidget {
  const FourAnswerItem1(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onTap});
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswer = ref.watch(selectedAnswer1);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              // color: Colors.blue,
              height: (MediaQuery.of(context).size.width / 2) - 84,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              )),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color:
                      selectedAnswer == 1 ? Colors.greenAccent : Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              height: (MediaQuery.of(context).size.width / 2) - 128,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Center(child: MyText(text, 18))),
        ],
      ),
    );
  }
}

class FourAnswerItem2 extends ConsumerWidget {
  const FourAnswerItem2(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onTap});
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswer = ref.watch(selectedAnswer1);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              // color: Colors.blue,
              height: (MediaQuery.of(context).size.width / 2) - 84,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              )),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color:
                      selectedAnswer == 2 ? Colors.greenAccent : Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              height: (MediaQuery.of(context).size.width / 2) - 128,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Center(child: MyText(text, 18))),
        ],
      ),
    );
  }
}

class FourAnswerItem3 extends ConsumerWidget {
  const FourAnswerItem3(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onTap});
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswer = ref.watch(selectedAnswer1);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              // color: Colors.blue,
              height: (MediaQuery.of(context).size.width / 2) - 84,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              )),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color:
                      selectedAnswer == 3 ? Colors.greenAccent : Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              height: (MediaQuery.of(context).size.width / 2) - 128,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Center(child: MyText(text, 18))),
        ],
      ),
    );
  }
}

class FourAnswerItem4 extends ConsumerWidget {
  const FourAnswerItem4(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onTap});
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswer = ref.watch(selectedAnswer1);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              // color: Colors.blue,
              height: (MediaQuery.of(context).size.width / 2) - 84,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              )),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color:
                      selectedAnswer == 4 ? Colors.greenAccent : Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              height: (MediaQuery.of(context).size.width / 2) - 128,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Center(child: MyText(text, 18))),
        ],
      ),
    );
  }
}