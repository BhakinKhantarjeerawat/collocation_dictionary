import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/topics/chapter_widget.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';

List<ChapterWidget> nounChapters = [
  ChapterWidget(
    imagePath: Assets.images.intro.path,
    title: 'พื้นฐาน',
    navigateTo: const Text('unimplemented yet'),
  ),
  ChapterWidget(
    imagePath: Assets.images.list.path,
    title: 'จำนวนหนึ่งหรือมากกว่าหนึ่ง',
    navigateTo: const HomeScreen(),
  ),
  ChapterWidget(
    imagePath: Assets.images.list.path,
    title: 'นามเฉพาะ vs นามทั่วไป',
    navigateTo: const HomeScreen(),
  ),
  ChapterWidget(
      imagePath: Assets.images.list.path,
      title: 'a, an, the',
      navigateTo: const HomeScreen()),
  ChapterWidget(
      imagePath: Assets.images.list.path,
      title: 'นามนับได้ vs นับไม่ได้',
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
