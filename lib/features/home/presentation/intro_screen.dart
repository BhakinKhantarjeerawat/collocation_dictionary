import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/common_widgets/gradient_button.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/test_hero_animation.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final introScreenPageController = StateProvider<PageController>((ref) {
  return PageController();
});

List<Widget> introAppScreens = [
  const WelcomeScreen(),
  const PurposeScreen(),
  const EnglishLevelScreen()
];

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.images.beanStalk.path),
          gapH32,
          const MyText('Welcome to English Collocations', 29),
          gapH16,
          MyText(
            'We hope this app will help you learn English systematically and enjoyably',
            18,
            color: Colors.grey.shade700,
          ),
          gapH48,
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: ElevatedButton(
                onPressed: () {
                  ref.read(introScreenPageController).nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: const Text('Next')),
          ),
          gapH16,
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: GradientButtonFb4(
              text: 'Start learning immediately',
              onPressed: () {
                myNavigate(context, screen: const TestHeroAnimation());
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class PurposeScreen extends ConsumerWidget {
  const PurposeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.images.dragon.path),
          gapH32,
          const MyText('What do you want from this app?', 29),
          gapH32,
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: ElevatedButton(
                onPressed: () {
                  ref.read(introScreenPageController).nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: const Text('Support study')),
          ),
          gapH16,
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: ElevatedButton(
                onPressed: () {
                  ref.read(introScreenPageController).nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: const Text('For jobs')),
          ),
          // gapH32,
          // SizedBox(
          //   width: MediaQuery.of(context).size.width - 32,
          //   child: GradientButtonFb4(
          //       onPressed: () {
          //         ref.read(introScreenPageController).nextPage(
          //             duration: const Duration(milliseconds: 500),
          //             curve: Curves.easeIn);
          //       },
          //       text: 'Next'),
          // ),
        ],
      ),
    ));
  }
}

class EnglishLevelScreen extends ConsumerWidget {
  const EnglishLevelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.images.document.path),
            gapH32,
            const MyText('What is your English level?', 29),
            gapH32,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Know nothing')),
            ),
            gapH16,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Know something')),
            ),
            gapH16,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Know vocabs and grammars')),
            ),
            gapH16,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                  onPressed: () {
                    ref.read(introScreenPageController).nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: const Text('Just review (Advanced)')),
            ),
            gapH16,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: GradientButtonFb4(
                  text: 'Start learning immediately',
                  onPressed: () {
                    myNavigate(context, screen: const HomeScreen());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  int activePage = 0;

  // late PageController _pageController = PageController();
  // void nextPage() {
  //   _pageController.nextPage(
  //       duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: introAppScreens.length,
          pageSnapping: true,
          controller: ref.watch(introScreenPageController),
          onPageChanged: (page) {
            setState(() {
              activePage = page;
            });
          },
          itemBuilder: (context, pagePosition) {
            return Container(child: introAppScreens[pagePosition]);
          }),
    );
  }
}
