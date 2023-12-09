import 'package:collocation_dictionary/common_widgets/display_bottom_sheet.dart';
import 'package:collocation_dictionary/common_widgets/my_border_button1.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/topics/noun/presentation/chapters_intro/noun0.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ExerciseType { threeAnswers, fourAnswers }

List<Exercise> exercisesList = [
  Exercise(
      exerciseType: ExerciseType.threeAnswers,
      question: 'dog',
      correctAnswer: "หมา",
      choices: ["หมา", "แมว", "ถูกทุกข้อ"]),
  Exercise(
      exerciseType: ExerciseType.threeAnswers,
      question: 'cat',
      correctAnswer: "แมว",
      choices: ["หมา", "แมว", "ถูกทุกข้อ"]),
  Exercise(
      exerciseType: ExerciseType.fourAnswers,
      question: 'bird',
      correctAnswer: "ไม่ถูกสักข้อ",
      choices: ["หมา", "แมว", "ไม่ถูกสักข้อ"],
      nextChapter: const Noun0()),
  Exercise(
      exerciseType: ExerciseType.threeAnswers,
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
      this.nextChapter,
      required this.exerciseType});
  final Widget? nextChapter;
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final ExerciseType exerciseType;
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
                physics: const NeverScrollableScrollPhysics(),
                itemCount: exercisesList.length,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return exercisesList[activePage].exerciseType ==
                          ExerciseType.threeAnswers
                      ? ChoiceQuestionScreen(
                          question: exercisesList[activePage].question,
                          correctAnswer:
                              exercisesList[activePage].correctAnswer,
                          choices: exercisesList[activePage].choices,
                        )
                      : FourChoicesQuestion(
                          question: exercisesList[activePage].question,
                          correctAnswer:
                              exercisesList[activePage].correctAnswer,
                          choices: exercisesList[activePage].choices,
                        );
                })),
        selectedAnswerProvider == -1
            ? Container(
                color: Colors.grey.shade200,
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: const Center(
                    child: MyText(
                  'ต้องเลือกคำตอบก่อน',
                  21,
                )))
            : GestureDetector(
                onTap: () {
                  displayBottomSheet1(context,
                      pageController: _pageController,
                      correctAnswer: exercisesList[activePage].correctAnswer,
                      selectedAnswer: exercisesList[activePage]
                          .choices[selectedAnswerProvider],
                      nextChapter: exercisesList[activePage].nextChapter);
                  ref.read(selectedAnswer1.notifier).state = 0;
                },
                child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff53E88B), Color(0xff15BE77)])),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    child: const Center(
                        child: MyText(
                      'ตรวจคำตอบ',
                      21,
                      color: Colors.white,
                    )))),
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

class FourChoicesQuestion extends ConsumerStatefulWidget {
  const FourChoicesQuestion({
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
      _FourChoicesQuestionState();
}

class _FourChoicesQuestionState extends ConsumerState<FourChoicesQuestion> {
  int selectedAnswer = 0;

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
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FourAnswerItem(),
                    FourAnswerItem(),
                  ]),
              gapH16,
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FourAnswerItem(),
                    FourAnswerItem(),
                  ]),
            ]),
      ),
    ));
  }
}

class FourAnswerItem extends StatelessWidget {
  const FourAnswerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
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
                Assets.images.bird.path,
                fit: BoxFit.contain,
              )),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              height: (MediaQuery.of(context).size.width / 2) - 128,
              width: MediaQuery.of(context).size.width / 2.5,
              child: const Center(child: MyText('abbreviationst', 18))),
        ],
      ),
    );
  }
}
