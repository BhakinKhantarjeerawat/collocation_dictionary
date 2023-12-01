import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/topics/chapter_widget.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';

List<Widget> pronounChapters = [
  ChapterWidget(
    imagePath: Assets.images.intro.path,
    title: 'พื้นฐาน',
    navigateTo: const HomeScreen(),
  ),
  ChapterWidget(
    imagePath: Assets.images.list.path,
    title: 'แบบธรรมดา',
    navigateTo: const HomeScreen(),
  ),
  ChapterWidget(
    imagePath: Assets.images.list.path,
    title: 'แบบแสดงความเป็นเจ้าของ',
    navigateTo: const HomeScreen(),
  ),
  ChapterWidget(
      imagePath: Assets.images.list.path,
      title: 'แบบถูกกระทำ',
      navigateTo: const HomeScreen()),
  ChapterWidget(
      imagePath: Assets.images.summary.path,
      title: 'สรุป',
      navigateTo: const HomeScreen()),
  ChapterWidget(
    imagePath: Assets.images.quiz.path,
    title: 'แบบฝึกหัดทั้งหมด',
    navigateTo: const HomeScreen(),
  ),
];
