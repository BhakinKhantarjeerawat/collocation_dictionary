import 'package:collocation_dictionary/common_widgets/display_bottom_sheet.dart';
import 'package:collocation_dictionary/common_widgets/my_border_button1.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/topics/noun/presentation/chapters_intro/noun0.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Exercise> exercisesList = [
  Exercise(
      question: 'dog',
      correctAnswer: "หมา",
      choices: ["หมา", "แมว", "ถูกทุกข้อ"]),
  Exercise(
      question: 'cat',
      correctAnswer: "แมว",
      choices: ["หมา", "แมว", "ถูกทุกข้อ"]),
  Exercise(
      question: 'bird',
      correctAnswer: "ไม่ถูกสักข้อ",
      choices: ["หมา", "แมว", "ไม่ถูกสักข้อ"],
      nextChapter: const Noun0()),
];

class Exercise {
  Exercise(
      {required this.question,
      required this.correctAnswer,
      required this.choices,
      this.nextChapter});
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final Widget? nextChapter;
}

class ExcercisePageView1 extends ConsumerStatefulWidget {
  const ExcercisePageView1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExcercisePageView1State();
}

class _ExcercisePageView1State extends ConsumerState<ExcercisePageView1> {
  int activePage = 0;

  late PageController _pageController = PageController();

  void nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final selectedAnswerProvider = ref.watch(selectedAnswer1) - 1;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: PageView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: exercisesList.length,
                // pageSnapping: false,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                    // ref.read(activePageProvider.notifier).state = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return ChoiceQuestionScreen(
                    question: exercisesList[activePage].question,
                    correctAnswer: exercisesList[activePage].correctAnswer,
                    choices: exercisesList[activePage].choices,
                  );
                })),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: ElevatedButton(
                onPressed: () {
                  displayBottomSheet1(context,
                      pageController: _pageController,
                      correctAnswer: exercisesList[activePage].correctAnswer,
                      selectedAnswer: exercisesList[activePage]
                          .choices[selectedAnswerProvider],
                      nextChapter: exercisesList[activePage].nextChapter  
                      );
                  ref.read(selectedAnswer1.notifier).state = 0;
                },
                child: const Text('ตรวจคำตอบ'))),
      ],
    ));
  }
}

class ChoiceQuestionScreen extends ConsumerStatefulWidget {
  const ChoiceQuestionScreen({
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
      _ChoiceQuestionScreenState();
}

class _ChoiceQuestionScreenState extends ConsumerState<ChoiceQuestionScreen> {
  int selectedAnswer = 0;
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
          MyBorderButton5(text: widget.choices[0]),
          gapH16,
          MyBorderButton6(text: widget.choices[1]),
          gapH16,
          MyBorderButton7(text: widget.choices[2]),
        ]),
      )),
    );
  }
}
