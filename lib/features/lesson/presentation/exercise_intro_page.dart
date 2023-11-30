import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/common_widgets/ny_step_progress.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> explainPages = [
  const FirstLesson1(),
];

class FirstLesson1 extends ConsumerStatefulWidget {
  const FirstLesson1({super.key});

  @override
  ConsumerState<FirstLesson1> createState() => _FirstLesson1State();
}

class _FirstLesson1State extends ConsumerState<FirstLesson1> {
  int activeStep = 5;
  final List<String> items = List<String>.generate(10, (i) => '$i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        //2
        SliverAppBar(
          centerTitle: true,
          elevation: 0,
          pinned: true,
          expandedHeight: 70.0,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                      child: MyText(
                    'Goa',
                    21,
                    color: Colors.blueAccent,
                  )),
                ],
              ),
              background: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blueAccent, Colors.white])),
              )),
        ),
        //3
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return ListTile(
                leading: Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    child: const Placeholder()),
                title: Text('Place ${index + 1}', textScaleFactor: 2),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    ));
  }
}

class ExcerciseIntroPage extends ConsumerStatefulWidget {
  const ExcerciseIntroPage({super.key, required this.explainPages});
  final List<Widget> explainPages;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExcerciseIntroPageState();
}

class _ExcerciseIntroPageState extends ConsumerState<ExcerciseIntroPage> {
  int activePage = 0;

  late PageController _pageController = PageController();
  void nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.explainPages.length,
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            activePage = page;
          });
        },
        itemBuilder: (context, pagePosition) {
          return Container(child: widget.explainPages[pagePosition]);
        });
  }
}



// Stack(
//       children: [
//         Container(
//           height: MediaQuery.of(context).size.height * 0.2,
//           width: double.infinity,
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.blueAccent, Colors.white])),
//           child: Column(
//             children: [
//               gapH64,
//               Opacity(
//                 opacity: 0.5,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Column(
//           children: [
//             gapH32,
//             Row(
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.close,
//                       color: Colors.white,
//                       size: 34,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 const MyText('Pronoun', 29)
//               ],
//             ),
//             SingleChildScrollView(
//                 child: Column(children: [
//               gapH64,
//               ListTile(
//                 onTap: () {},
//                 leading: Image.asset(Assets.images.intro.path),
//                 title: const Text('Introduction'),
//               ),
//               gapH32,
//               gapH32,
//               ListTile(
//                 onTap: () {},
//                 leading: Image.asset(Assets.images.bulb.path),
//                 title: const Text('Object pronoun'),
//               ),
//               gapH32,
//               ListTile(
//                 onTap: () {},
//                 leading: Image.asset(Assets.images.bulb.path),
//                 title: const Text('Object pronoun'),
//               ),
//               gapH32,
//               ListTile(
//                 onTap: () {},
//                 leading: Image.asset(Assets.images.bulb.path),
//                 title: const Text('Object pronoun'),
//               ),
//               gapH32,
//               gapH32,
//               ListTile(
//                 onTap: () {},
//                 leading: Image.asset(Assets.images.beanStalk.path),
//                 title: const Text('Introduction'),
//                 subtitle: const SizedBox(
//                     width: 25,
//                     child: MyStepProgress(totalSteps: 9, currentStep: 2)),
//               ),
//               gapH32,
//               ListTile(
//                 onTap: () {},
//                 leading: Image.asset(Assets.images.soy.path),
//                 title: const Text('Possesive pronoun'),
//                 subtitle: const MyStepProgress(totalSteps: 9, currentStep: 7),
//               ),
//               gapH32,
//               ListTile(
//                 onTap: () {},
//                 leading: Image.asset(Assets.images.bulb.path),
//                 title: const Text('Object pronoun'),
//               ),
//               gapH32,
//               ListTile(
//                 onTap: () {},
//                 leading: Image.asset(Assets.images.bulb.path),
//                 title: const Text('Object pronoun'),
//               ),
//             ])),
//           ],
//         ),
//       ],
//     ));