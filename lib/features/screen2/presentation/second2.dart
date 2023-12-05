import 'package:collocation_dictionary/features/exercises_template/choice_question_widget.dart';
import 'package:collocation_dictionary/features/topics/chapter_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Second2 extends ConsumerWidget {
  const Second2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return 
    // const Scaffold(
    //   backgroundColor: Colors.blueAccent,
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           TestCard(),
    //           gapW16,
    //           TestCard(),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           TestCard(),
    //           gapW16,
    //           TestCard(),
    //         ],
    //       ),
    //     ],
    //   ),
    // );

    ChapterPageView(chapters: choiceQuestionList);

  }
}
