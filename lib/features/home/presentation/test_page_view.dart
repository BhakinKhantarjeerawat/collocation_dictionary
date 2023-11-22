import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// List<Widget> textWidgets = [
//   const Text('aa'),
//   const Text('bb'),
//   const Text('cc')
// ];

class TestPageView extends ConsumerStatefulWidget {
  const TestPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestPageViewState();
}

class _TestPageViewState extends ConsumerState<TestPageView> {
  int activePage = 0;
  late PageController _pageController;
  List<Widget> dragWidgets = [
    const DragWidget(
      shownWord: 'pencil',
      firstChoice: 'his',
      secondChoice: 'her',
      answer: 'his',
    ),
    const DragWidget(
      shownWord: 'pen',
      firstChoice: 'my',
      secondChoice: 'your',
      answer: 'my',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          gapH32,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            child: StepProgressIndicator(
              totalSteps: 100,
              currentStep: 32,
              size: 8,
              padding: 0,
              selectedColor: Colors.yellow,
              unselectedColor: Colors.grey.shade100,
              roundedEdges: const Radius.circular(10),
              selectedGradientColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.yellowAccent, Colors.deepOrange],
              ),
            ),
          ),
          gapH16,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
                itemCount: 3,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Container(
                      // margin: const EdgeInsets.all(10),
                      child: dragWidgets[pagePosition]);
                }),
          ),
        ],
      ),
    );
  }
}
