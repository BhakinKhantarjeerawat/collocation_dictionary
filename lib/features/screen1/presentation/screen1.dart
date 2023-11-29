import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/lesson/data/lesson_lists.dart';
import 'package:collocation_dictionary/features/lesson/presentation/exercises_screen.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstScreen extends ConsumerWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          const _TopGradient(),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  gapH64,
                  Screen1LessonWidget(
                    assetPath: Assets.images.beanStalk.path,
                    text: 'First Lesson',
                    onPressed: () {
                      myNavigate(context,
                          screen: ExercisesScreen(lesson: pronounLesson1));
                    },
                  ),
                  gapH16,
                  Screen1LessonWidget(
                    assetPath: Assets.images.clock.path,
                    text: 'Second',
                    onPressed: () {},
                  ),
                  gapH16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Screen1LessonWidget(
                        assetPath: Assets.images.document.path,
                        text: 'Third Lesson',
                        onPressed: () {},
                      ),
                      Screen1LessonWidget(
                        assetPath: Assets.images.oven.path,
                        text: 'Fourth',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  gapH16,
                  Screen1LessonWidget(
                    assetPath: Assets.images.ramen.path,
                    text: 'Second',
                    onPressed: () {},
                  ),
                  gapH16,
                  Screen1LessonWidget(
                    assetPath: Assets.images.soy.path,
                    text: 'First Lesson',
                    onPressed: () {},
                  ),
                  gapH16,
                  Screen1LessonWidget(
                    assetPath: Assets.images.wind.path,
                    text: 'Second',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopPart extends StatelessWidget {
  const _TopPart();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 34,
            ),
            onPressed: () {},
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16)),
              child: const Row(
                children: [
                  Icon(FontAwesomeIcons.mountain, color: Colors.blueAccent),
                  gapW16,
                  MyText(
                    '0',
                    23,
                    color: Colors.blueAccent,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Screen1LessonWidget extends StatelessWidget {
  const Screen1LessonWidget(
      {super.key,
      required this.assetPath,
      required this.text,
      required this.onPressed});
  final String assetPath;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.blueAccent,
          backgroundImage: AssetImage(assetPath),
        ),
        gapH4,
        Center(
          child: MyText(text, 21, color: Colors.grey.shade700),
        ),
      ]),
    );
  }
}

class _TopGradient extends StatelessWidget {
  const _TopGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.blueAccent, Colors.white],
      )),
      child: const Column(
        children: [
          gapH20,
          Align(alignment: Alignment.topCenter, child: _TopPart()),
        ],
      ),
    );
  }
}
