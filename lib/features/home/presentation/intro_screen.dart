import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/common_widgets/gradient_button.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final introScreenPageController = StateProvider<PageController>((ref) {
  return PageController();
});

List<Widget> introAppScreens = [
  const WelcomeScreen(),
  const PurposeScreen(),
  const TimeSpentScreen(),
  const EnglishLevelScreen(),
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
          CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 3,
              child:
                  Image.asset(Assets.images.beanStalk.path, fit: BoxFit.cover)),
          gapH32,
          const MyText('ขอต้อนรับสู่ English Collocation', 29),
          gapH16,
          MyText(
            'เราหวังว่าแอ็พของเรา  จะช่วยให้คุณเรียนภาษาอังกฤษได้อย่างสนุกและเป็นระบบ',
            18,
            color: Colors.grey.shade700,
          ),
          gapH48,
          SizedBox(
            height: 52,
            width: MediaQuery.of(context).size.width - 32,
            child: ElevatedButton(
                onPressed: () {
                  ref.read(introScreenPageController).nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: const MyText('หน้าถัดไป', 16)),
          ),
          gapH16,
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: GradientButtonFb4(
              text: 'เริ่มเรียนทันที',
              onPressed: () {
                myNavigate(context, screen: const HomeScreen());
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
          CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 3,
              child: Image.asset(Assets.images.target.path)),
          gapH32,
          const MyText('เป้าหมายของคุณในการใช้งานแอ็พนี้คืออะไร', 29),
          gapH32,
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: ElevatedButton(
                onPressed: () {
                  ref.read(introScreenPageController).nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: const Text('เพื่อสนับสนุนการศึกษา')),
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
                child: const Text('เพื่อการทำงาน')),
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
                child: const Text('อื่นๆ')),
          ),
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
            CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: MediaQuery.of(context).size.width / 3,
                child: Image.asset(Assets.images.enLevels.path)),
            gapH32,
            const MyText('ภาษาอังกฤษของคุณอยู่ที่ระดับไหน', 29),
            gapH32,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                  onPressed: () {
                    myNavigate(context, screen: const HomeScreen());
                  },
                  child: const Text('ไม่รู้เลย')),
            ),
            gapH16,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                  onPressed: () {
                    myNavigate(context, screen: const HomeScreen());
                  },
                  child: const Text('อ่านออกเขียนได้บ้าง')),
            ),
            gapH16,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                  onPressed: () {
                    myNavigate(context, screen: const HomeScreen());
                  },
                  child: const Text('รู้คำศัพท์และไวยากรณ์ (ปานกลาง)')),
            ),
            gapH16,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                  onPressed: () {
                    myNavigate(context, screen: const HomeScreen());
                  },
                  child: const Text('แค่ทบทวน (ขั้นสูง)')),
            ),
            gapH16,
            GradientButtonFb4(
                text: 'เริ่มเรียนเลย!',
                onPressed: () {
                  myNavigate(context, screen: const HomeScreen());
                }),
          ],
        ),
      ),
    );
  }
}

class TimeSpentScreen extends ConsumerWidget {
  const TimeSpentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 3,
              child: Image.asset(Assets.images.clock.path, fit: BoxFit.cover)),
          gapH32,
          // const MyText('ในแต่ละวัน คุณคิดว่าคุณสามารถเรียนได้นานแค่ไหน', 29),
          // gapH16,
          MyText(
            'ในแต่ละวัน คุณคิดว่าคุณสามารถเรียนได้อย่างน้อยนานแค่ไหน',
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
                child: const Text('5 นาที')),
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
                child: const Text('15 นาที')),
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
                child: const Text('30 นาที')),
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
                child: const Text('มากกว่า 30 นาที')),
          ),
        ],
      ),
    ));
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
