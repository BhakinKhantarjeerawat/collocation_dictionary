import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/common_lists/lesson_lists.dart';
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
    return Scaffold(
      body: Column(
        children: [
          activePage == 0
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    children: [
                      Expanded(
                        child: StepProgressIndicator(
                          totalSteps: pronounLesson1.length,
                          currentStep: activePage + 1,
                          size: 8,
                          padding: 0,
                          selectedColor: Colors.green,
                          unselectedColor: Colors.grey.shade300,
                          roundedEdges: const Radius.circular(10),
                        ),
                      ),
                      gapW8,
                      MyText('$activePage  / ${pronounLesson1.length}', 16),
                    ],
                  ),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pronounLesson1.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Container(child: pronounLesson1[pagePosition]);
                }),
          ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ElevatedButton(
                    onPressed: (!ref.watch(isDroppedProvider) && activePage != 0 && activePage == pronounLesson1.length - 1)
                        ? null
                        : () {
                            ref.read(isDroppedProvider.notifier).state = false;
                            nextPage();
                          },
                    child: const Text('Next'),
                  ),
                )
        ],
      ),
    );
  }
}
