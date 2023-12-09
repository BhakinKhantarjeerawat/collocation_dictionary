import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/new_exercise/choice_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThreeChoicesQuestion extends ConsumerStatefulWidget {
  const ThreeChoicesQuestion({
    super.key,
    required this.question,
    required this.correctAnswer,
    required this.choices,
  });
  final String question;
  final String correctAnswer;
  final List<String> choices;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ThreeChoicesQuestionState();
}

class _ThreeChoicesQuestionState extends ConsumerState<ThreeChoicesQuestion> {
  // int selectedAnswer = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          gapH64,
          MyText(widget.question, 29),
          gapH32,
          ThreeChoicesQuestion1(text: widget.choices[0]),
          gapH16,
          ThreeChoicesQuestion2(text: widget.choices[1]),
          gapH16,
          ThreeChoicesQuestion3(text: widget.choices[2]),
        ]),
      )),
    );
  }
}

class ThreeChoicesQuestion1 extends ConsumerWidget {
  const ThreeChoicesQuestion1({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = ref.watch(selectedAnswer1) == 1;

    return GestureDetector(
      onTap: () {
        ref.read(selectedAnswer1.notifier).state = 1;
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: isPressed ? Colors.white : Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              width: isPressed ? 2 : 0,
              color: isPressed
                  ? const Color.fromARGB(255, 249, 130, 170)
                  : Colors.grey.shade200),
        ),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                // leading: isPressed
                //     ? Image.asset(Assets.images.check.path)
                //     : Image.asset(Assets.images.checkGrey.path),
                title: Text(text,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )),
        ),
      ),
    );
  }
}

class ThreeChoicesQuestion2 extends ConsumerWidget {
  const ThreeChoicesQuestion2({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = ref.watch(selectedAnswer1) == 2;
    return GestureDetector(
      onTap: () {
        ref.read(selectedAnswer1.notifier).state = 2;
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: isPressed ? Colors.white : Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              width: isPressed ? 2 : 0,
              color: isPressed
                  ? const Color.fromARGB(255, 249, 130, 170)
                  : Colors.grey.shade200),
        ),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                // leading: isPressed
                //     ? Image.asset(Assets.images.check.path)
                //     : Image.asset(Assets.images.checkGrey.path),
                title: Text(text,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )),
        ),
      ),
    );
  }
}


class ThreeChoicesQuestion3 extends ConsumerWidget {
  const ThreeChoicesQuestion3({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = ref.watch(selectedAnswer1) == 3;

    return GestureDetector(
      onTap: () {
        ref.read(selectedAnswer1.notifier).state = 3;
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: isPressed ? Colors.white : Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              width: isPressed ? 2 : 0,
              color: isPressed
                  ? const Color.fromARGB(255, 249, 130, 170)
                  : Colors.grey.shade200),
        ),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                // leading: isPressed
                //     ? Image.asset(Assets.images.check.path)
                //     : Image.asset(Assets.images.checkGrey.path),
                title: Text(text,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )),
        ),
      ),
    );
  }
}