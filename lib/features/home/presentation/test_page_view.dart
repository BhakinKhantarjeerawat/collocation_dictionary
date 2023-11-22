import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/project_lists/drag_widget_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

final pageControllerProvider = StateProvider<PageController>((ref) {
  return PageController();
});

class TestPageView extends ConsumerStatefulWidget {
  const TestPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestPageViewState();
}

class _TestPageViewState extends ConsumerState<TestPageView> {
  int activePage = 0;
  // final PageController _pageController = PageController();

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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: [
                Expanded(
                  child: StepProgressIndicator(
                    totalSteps: dragWidgets.length,
                    currentStep: activePage + 1,
                    size: 8,
                    padding: 0,
                    selectedColor: Colors.green,
                    unselectedColor: Colors.grey.shade300,
                    roundedEdges: const Radius.circular(10),
                  ),
                ),
                gapW8,
                MyText('${activePage + 1} / ${dragWidgets.length}', 16),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dragWidgets.length,
                pageSnapping: true,
                controller: ref.watch(pageControllerProvider),
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Container(child: dragWidgets[pagePosition]);
                }),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          //   child: ElevatedButton(
          //     onPressed: () => nextPage(),
          //     child: const Text('Next'),
          //   ),
          // )
        ],
      ),
    );
  }
}