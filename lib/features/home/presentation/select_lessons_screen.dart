import 'package:collocation_dictionary/features/lesson/data/lesson_lists.dart';
import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/features/lesson/presentation/exercises_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectLessonsScreen extends ConsumerWidget {
  const SelectLessonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: ListView(
          children: [
            ListTile(
                onTap: () => myNavigate(context,
                    screen: ExercisesScreen(lesson: pronounLesson1)),
                leading: const CircleAvatar(),
                title: const Text('pronoun (ประธาน)')),
     
            // ListTile(
            //     onTap: () => myNavigate(context, screen: MyPageView(lesson:pronounLesson1)),
            //     leading: const CircleAvatar(),
            //     title: const Text('pronoun (กรรม)')),
          ],
        ));
  }
}
