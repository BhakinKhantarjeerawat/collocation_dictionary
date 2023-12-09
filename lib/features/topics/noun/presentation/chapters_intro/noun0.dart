import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/features/exercises_template/choice_question_widget.dart';
import 'package:collocation_dictionary/features/topics/chapter_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Noun0 extends ConsumerStatefulWidget {
  const Noun0({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Noun0State();
}

class _Noun0State extends ConsumerState<Noun0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: ChapterPageView(chapters: choiceQuestionList)),
          GestureDetector(
            onTap: () {
              // displayBottomSheet(
              //   context,
              //   pageController: ref.read(pageControllerProvider),
              //   correctAnswer: choiceQuestionList[activePage].correctAnswer,
              //   selectedAnswer: ref.read(selectedAnswerProvider),
              // );
            },
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff53E88B), Color(0xff15BE77)])),
                  child: const Center(child: MyText('ตรวจคำตอบs', 16)),
                )),
          ),
        ],
      ),
    );
  }
}
