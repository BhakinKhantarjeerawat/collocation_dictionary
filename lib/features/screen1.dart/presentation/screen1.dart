import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstScreen extends ConsumerWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          const _topPart(),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  gapH32,
                  const Screen1Lesson(
                      assetPath: 'assets/images/happiness.png',
                      text: 'First Lesson'),
                  gapH16,
                  const Screen1Lesson(
                      assetPath: 'assets/images/happiness.png', text: 'Second'),
                  gapH16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Screen1Lesson(
                          assetPath: Assets.images.happiness.path,
                          text: 'Third Lesson'),
                      const Screen1Lesson(
                          assetPath: 'assets/images/happiness.png',
                          text: 'Fourth'),
                    ],
                  ),
                  gapH16,
                  const Screen1Lesson(
                      assetPath: 'assets/images/happiness.png', text: 'Second'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Screen1Lesson extends StatelessWidget {
  const Screen1Lesson({super.key, required this.assetPath, required this.text});
  final String assetPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint('lesson Icon is pressed!'),
      child: Column(children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.blueAccent,
          backgroundImage: AssetImage(assetPath),
        ),
        gapH4,
        Center(
          child: MyText(text, 23, color: Colors.grey.shade700),
        ),
      ]),
    );
  }
}

class _topPart extends StatelessWidget {
  const _topPart();

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
    );
  }
}
