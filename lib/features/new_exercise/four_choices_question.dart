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
  @override
  void initState() {
    // ref.read(ttsProvider).speak(widget.question);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(widget.question, 36),
              gapH32,
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                FourAnswerItem1(
                  index: 1,
                  choices: widget.choices,
                  imagePath: widget.imagePath[0],
                  text: widget.choices[0],
                  correctAnswer: widget.correctAnswer,
                  onTap: () {
                    ref.read(selectedAnswer1.notifier).state =
                        widget.choices[0];
                    ref.read(selectedChoice.notifier).state = 1;
                  },
                ),
                FourAnswerItem1(
                  index: 2,
                  choices: widget.choices,
                  imagePath: widget.imagePath[1],
                  text: widget.choices[1],
                  correctAnswer: widget.correctAnswer,
                  onTap: () {
                    ref.read(selectedAnswer1.notifier).state =
                        widget.choices[1];
                    ref.read(selectedChoice.notifier).state = 2;
                  },
                ),
              ]),
              gapH32,
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                FourAnswerItem1(
                  index: 3,
                  choices: widget.choices,
                  imagePath: widget.imagePath[2],
                  text: widget.choices[2],
                  correctAnswer: widget.correctAnswer,
                  onTap: () {
                    ref.read(selectedAnswer1.notifier).state =
                        widget.choices[2];
                    ref.read(selectedChoice.notifier).state = 3;
                  },
                ),
                FourAnswerItem1(
                  index: 4,
                  choices: widget.choices,
                  imagePath: widget.imagePath[3],
                  text: widget.choices[3],
                  correctAnswer: widget.correctAnswer,
                  onTap: () {
                    ref.read(selectedAnswer1.notifier).state =
                        widget.choices[3];
                    ref.read(selectedChoice.notifier).state = 4;
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
      required this.index,
      required this.imagePath,
      required this.text,
      required this.onTap,
      required this.correctAnswer,
      required this.choices});
  final int index;
  final String imagePath;
  final String text;
  final VoidCallback onTap;
  final String correctAnswer;
  final List<String> choices;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedAnswer = ref.watch(selectedAnswer1);
    final selectedChoiceProvider = ref.watch(selectedChoice);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              height: (MediaQuery.of(context).size.width / 2) - 84,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              )),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: index == selectedChoiceProvider
                      ? Colors.greenAccent
                      : Colors.grey.shade200,
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
