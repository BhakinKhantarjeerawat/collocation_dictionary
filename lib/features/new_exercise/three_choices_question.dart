import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/new_exercise/choice_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThreeChoicesQuestion extends ConsumerStatefulWidget {
  const ThreeChoicesQuestion(
      {super.key,
      required this.question,
      required this.correctAnswer,
      required this.choices,
      this.imagePath});
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final String? imagePath;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ThreeChoicesQuestionState();
}

class _ThreeChoicesQuestionState extends ConsumerState<ThreeChoicesQuestion> {
  @override
  void initState() {
    // ref.read(ttsProvider).speak(widget.question);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 210, child: Image.asset(widget.imagePath!)),
          MyText(widget.question, 34),
          gapH32,
          ThreeChoicesQuestion1(text: widget.choices[0], index:1),
          gapH16,
          ThreeChoicesQuestion1(text: widget.choices[1], index:2),
          gapH16,
          ThreeChoicesQuestion1(text: widget.choices[2], index:3),
        ]),
      ),
    );
  }
}

class ThreeChoicesQuestion1 extends ConsumerStatefulWidget {
  const ThreeChoicesQuestion1({super.key, required this.text, required this.index});
  final String text;
  final int index;

  @override
  ConsumerState<ThreeChoicesQuestion1> createState() =>
      _ThreeChoicesQuestion1State();
}

class _ThreeChoicesQuestion1State extends ConsumerState<ThreeChoicesQuestion1> {

  @override
  Widget build(BuildContext context) {
    final isPressed = ref.watch(selectedChoice) == widget.index;

    return GestureDetector(
      onTap: () {
        ref.read(selectedChoice.notifier).state = widget.index;
        ref.read(selectedAnswer1.notifier).state = widget.text;
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
                title: Text(widget.text,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )),
        ),
      ),
    );
  }
}
