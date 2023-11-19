import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/lesson_list.dart';
import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/home/presentation/introduction_screen1.dart';
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
          child: ListView.separated(
              separatorBuilder: (context, index) => gapH16,
              itemCount: lessonList.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      myNavigate(context, screen: const HomeScreen());
                    },
                    child: SizedBox(
                        height: 120,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                            ),
                            gapW32,
                            Text(lessonList[index],
                                style: const TextStyle(fontSize: 21)),
                          ],
                        )),
                  )),
        ));
  }
}
