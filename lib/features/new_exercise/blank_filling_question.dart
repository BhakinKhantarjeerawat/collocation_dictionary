import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/new_exercise/choice_question_screen.dart';
import 'package:collocation_dictionary/features/new_exercise/three_choices_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlankFillingQuestion extends ConsumerStatefulWidget {
  const BlankFillingQuestion(
      {required this.question,
      required this.correctAnswer,
      required this.choices,
      required this.imagePath,
      super.key});
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final String? imagePath;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BlankFillingQuestionState();
}

class _BlankFillingQuestionState extends ConsumerState<BlankFillingQuestion> {
  @override
  Widget build(BuildContext context) {
    final selectedChoice = ref.watch(selectedAnswer1) - 1;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 210, child: Image.asset(widget.imagePath!)),
          selectedChoice == -1
              ? MyText(widget.question + '_______', 34)
              : MyText(
                  '${widget.question} ${widget.choices[selectedChoice]}', 24),
          gapH32,
          ThreeChoicesQuestion1(text: widget.choices[0]),
          gapH16,
          ThreeChoicesQuestion2(text: widget.choices[1]),
          gapH16,
          ThreeChoicesQuestion3(text: widget.choices[2]),
        ]),
      ),
    );
  }
}
