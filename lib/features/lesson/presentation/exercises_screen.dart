import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:collocation_dictionary/common_widgets/my_local_hero_widget.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/common_widgets/ny_step_progress.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/presentation/select_lessons_screen.dart';
import 'package:collocation_dictionary/features/lesson/data/lesson_lists.dart';
import 'package:collocation_dictionary/features/lesson/presentation/speech_to_text_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wrongAnswerProvider = StateProvider<Set<int>>((ref) {
  return <int>{};
});

class ExercisesScreen extends ConsumerStatefulWidget {
  const ExercisesScreen({super.key, required this.lesson});
  final List<Widget> lesson;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExercisesScreenState();
}

class _ExercisesScreenState extends ConsumerState<ExercisesScreen> {
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
    return Scaffold(
      body: Column(
        children: [
          activePage == 0
              ? const SizedBox()
              : MyPageViewTopPart(
                  totalStep: widget.lesson.length, currentStep: activePage),
          // * ^^^ TOP PART /////////
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.lesson.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Container(child: widget.lesson[pagePosition]);
                }),
          ),
          // * VVV BOTTOM PART /////////
          Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            color: Colors.blueAccent,
            child: ElevatedButton(
              onPressed: (!ref.watch(isDroppedProvider) &&
                      activePage != 0 &&
                      activePage != widget.lesson.length - 1)
                  ? null
                  : () {
                      if (activePage == widget.lesson.length - 1) {
                        if (pronounLesson1Wrongs.isEmpty) {
                          myNavigate(context,
                              screen: const SelectLessonsScreen());
                        }
                        myNavigate(context,
                            screen:
                                ExercisesScreen(lesson: pronounLesson1Wrongs.toList()));
                        // _pageController.jumpToPage(3);
                      }
                      ref.read(isDroppedProvider.notifier).state = false;
                      nextPage();
                    },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPageViewTopPart extends ConsumerWidget {
  const MyPageViewTopPart(
      {super.key, required this.totalStep, required this.currentStep});
  final int totalStep;
  final int currentStep;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.blueAccent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          gapH32,
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.back_hand, color: Colors.white)),
            Row(
              children: [
                IconButton(
                    onPressed: () =>
                        myNavigate(context, screen: const LocalHeroPage()),
                    icon: const Icon(Icons.house),
                    color: Colors.white),
                gapW4,
                const MyText('25', 27),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      myNavigate(context, screen: const Stt());
                    },
                    icon: const Icon(Icons.house, color: Colors.white)),
                gapW4,
                const MyText('25', 25),
              ],
            ),
          ]),
          Row(
            children: [
              Expanded(
                  child: MyStepProgress(
                      totalSteps: totalStep, currentStep: currentStep + 1)),
              gapW8,
              MyText('$currentStep  / $totalStep', 20),
            ],
          ),
        ],
      ),
    );
  }
}
