import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/home/presentation/lessons_screen.dart';
import 'package:collocation_dictionary/global_methods.dart/my_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              ListTile(
                  onTap: () => myNavigate(context, screen: const HomeScreen()),
                  leading: const CircleAvatar(),
                  title: const Text('home')),
                  gapH16,
                  ListTile(
                  onTap: () => myNavigate(context, screen: const LessonsScreen()),
                  leading: const CircleAvatar(),
                  title: const Text('lessons')),
            ],
          ),
        ));
  }
}
