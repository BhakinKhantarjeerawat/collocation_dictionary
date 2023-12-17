import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/common_widgets/display_bottom_sheet.dart';
import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/common_widgets/ny_step_progress.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/lesson/data/lesson_lists.dart';
import 'package:collocation_dictionary/features/lesson/presentation/exercises_screen.dart';
import 'package:collocation_dictionary/features/new_exercise/blank_filling_question.dart';
import 'package:collocation_dictionary/features/new_exercise/four_choices_question.dart';
import 'package:collocation_dictionary/features/new_exercise/three_choices_question.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ExerciseType {
  threeAnswers,
  fourAnswers,
  lastPage,
  exerciseScreen,
  blankFill
}

final selectedChoice = StateProvider<int>((ref) {
  return 0;
});

final selectedAnswer1 = StateProvider<String>((ref) {
  return "";
});

final scoreProvider = StateProvider<int>((ref) {
  return 0;
});

List<Exercise> exercisesList = [
  Exercise(
      exerciseType: ExerciseType.threeAnswers,
      imagePath: Assets.images.dog.path,
      question: 'dog',
      correctAnswer: "หมา",
      choices: ["หมา", "แมว", "ถูกทุกข้อ"]),
  // Exercise(
  //     imagePath: Assets.images.dog.path,
  //     exerciseType: ExerciseType.blankFill,
  //     question: 'my',
  //     correctAnswer: "daughter",
  //     choices: ["daughter", "son", "sister"]),
  // * ----------------
  // Exercise(
  //   exerciseType: ExerciseType.exerciseScreen,
  //   // shownWord: 'pencil',
  //   question: 'pencil1',
  //   choices: ['his', 'her', 'our'],
  //   // answer: 'his',
  //   correctAnswer: 'his',
  //   imagePath: 'assets/images/happiness.png',
  // ),
  Exercise(
      exerciseType: ExerciseType.threeAnswers,
      imagePath: Assets.images.cat.path,
      question: 'cat',
      correctAnswer: "แมว",
      choices: ["หมา", "แมว", "ถูกทุกข้อ"]),
  Exercise(
    imagePathList: [
      Assets.images.dog.path,
      Assets.images.cat.path,
      Assets.images.bird.path,
      Assets.images.fish.path,
    ],
    exerciseType: ExerciseType.fourAnswers,
    question: "นก",
    correctAnswer: "bird",
    choices: ["dog", "cat", "bird", "fish"],
  ),
  Exercise(
    imagePath: Assets.images.bird.path,
    exerciseType: ExerciseType.threeAnswers,
    question: 'bird',
    correctAnswer: "นก",
    choices: ["หมา", "แมว", "นก"],
  ),
  Exercise(
      frontCover: Assets.images.light.path,
      exerciseType: ExerciseType.lastPage,
      question: 'สรุปคะแนน',
      correctAnswer: "สรุปคะแนน",
      choices: ["สรุปคะแนน", "สรุปคะแนน", "สรุปคะแนน"],
      nextChapter: const HomeScreen()),
];

class Exercise {
  Exercise(
      {required this.question,
      required this.correctAnswer,
      required this.choices,
      this.nextChapter,
      required this.exerciseType,
      this.imagePathList,
      this.imagePath,
      this.frontCover});
  final Widget? nextChapter;
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final ExerciseType exerciseType;
  final List<String>? imagePathList;
  final String? imagePath;
  final String? frontCover;
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
    final selectedAnswer = ref.watch(selectedAnswer1);
    return Scaffold(
        backgroundColor: activePage == exercisesList.length - 1
            ? Colors.black
            : Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            activePage == exercisesList.length - 1
                ? const SizedBox()
                : Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close)),
                        gapH8,
                        Expanded(
                            child: MyStepProgress(
                                totalSteps: 4, currentStep: activePage)),
                        gapW8,
                        MyText(
                            '${ref.watch(scoreProvider)} / ${exercisesList.length}',
                            16),
                        gapW8,
                      ],
                    ),
                  ),
            SizedBox(
                height: activePage == exercisesList.length - 1
                    ? MediaQuery.of(context).size.height * 0.9
                    : MediaQuery.of(context).size.height * 0.8,
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
                      switch (exercisesList[activePage].exerciseType) {
                        case ExerciseType.threeAnswers:
                          return ThreeChoicesQuestion(
                            imagePath: exercisesList[activePage].imagePath,
                            question: exercisesList[activePage].question,
                            correctAnswer:
                                exercisesList[activePage].correctAnswer,
                            choices: exercisesList[activePage].choices,
                          );
                        case ExerciseType.fourAnswers:
                          return FourChoicesQuestion(
                            imagePath: exercisesList[activePage].imagePathList!,
                            question: exercisesList[activePage].question,
                            correctAnswer:
                                exercisesList[activePage].correctAnswer,
                            choices: exercisesList[activePage].choices,
                          );
                        case ExerciseType.lastPage:
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    exercisesList[activePage].frontCover!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const MyText("คะแนน", 29, color: Colors.white),
                                MyText(
                                    "${ref.watch(scoreProvider)} / ${exercisesList.length - 1}",
                                    29,
                                    color: Colors.white),
                                gapH16,
                                Opacity(
                                  opacity: 0.5,
                                  child: ElevatedButton(
                                    child: const Text('Next'),
                                    onPressed: () {
                                      ref.read(scoreProvider.notifier).state =
                                          0;
                                      myNavigate(context,
                                          screen: exercisesList[activePage]
                                              .nextChapter);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        case ExerciseType.exerciseScreen:
                          return DragWidget(
                              shownWord: exercisesList[activePage].question,
                              choices: exercisesList[activePage].choices,
                              answer: exercisesList[activePage].correctAnswer,
                              activePage: activePage);
                        case ExerciseType.blankFill:
                          return BlankFillingQuestion(
                              imagePath: exercisesList[activePage].imagePath,
                              question: exercisesList[activePage].question,
                              choices: exercisesList[activePage].choices,
                              correctAnswer:
                                  exercisesList[activePage].correctAnswer);
                      }
                    })),
            selectedAnswer == ""
                ? Container(
                    color: Colors.transparent,
                    height: activePage == exercisesList.length - 1
                        ? MediaQuery.of(context).size.height * 0.0
                        : MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                  )
                : GestureDetector(
                    onTap: () {
                      displayBottomSheet(context,
                          ref: ref,
                          pageController: _pageController,
                          correctAnswer:
                              exercisesList[activePage].correctAnswer,
                          selectedAnswer: selectedAnswer,
                          nextChapter: exercisesList[activePage].nextChapter);
                      ref.read(selectedChoice.notifier).state = 0;
                      ref.read(selectedAnswer1.notifier).state = "";
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xff53E88B),
                          Color(0xff15BE77)
                        ])),
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
