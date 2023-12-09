import 'package:collocation_dictionary/common_widgets/display_bottom_sheet.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/features/new_exercise/four_choices_question.dart';
import 'package:collocation_dictionary/features/new_exercise/three_choices_question.dart';
import 'package:collocation_dictionary/features/topics/noun/presentation/chapters_intro/noun0.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ExerciseType { threeAnswers, fourAnswers }

final selectedAnswer1 = StateProvider<int>((ref) {
  return 0;
});


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
    imagePathList: [
      Assets.images.dragon.path,
      Assets.images.bulb.path,
      Assets.images.bird.path,
      Assets.images.happiness.path,
    ],
    exerciseType: ExerciseType.fourAnswers,
    question: 'bird',
    correctAnswer: "นก",
    choices: ["หมา", "แมว", "นก", "ปลา"],
  ),
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
      required this.exerciseType,
      this.imagePathList});
  final Widget? nextChapter;
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final ExerciseType exerciseType;
  final List<String>? imagePathList;
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
                      ? ThreeChoicesQuestion(
                          question: exercisesList[activePage].question,
                          correctAnswer:
                              exercisesList[activePage].correctAnswer,
                          choices: exercisesList[activePage].choices,
                        )
                      : FourChoicesQuestion(
                          imagePath: exercisesList[activePage].imagePathList!,
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




