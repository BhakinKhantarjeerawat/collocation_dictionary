import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TestPageView extends ConsumerStatefulWidget {
  const TestPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestPageViewState();
}

class _TestPageViewState extends ConsumerState<TestPageView> {
  int activePage = 0;
  late PageController _pageController;

  void nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

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
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height * 0.1,
            child: StepProgressIndicator(
              totalSteps: dragWidgets.length,
              currentStep: activePage + 1,
              size: 8,
              padding: 0,
              selectedColor: Colors.yellow,
              unselectedColor: Colors.grey.shade100,
              roundedEdges: const Radius.circular(10),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dragWidgets.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Container(child: dragWidgets[pagePosition]);
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              onPressed: () => nextPage(),
              child: const Text('Next'),
            ),
          )
        ],
      ),
    );
  }
}
