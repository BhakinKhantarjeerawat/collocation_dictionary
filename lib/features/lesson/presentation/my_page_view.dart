import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyPageView extends ConsumerStatefulWidget {
  const MyPageView({super.key, required this.lesson});
  final List<Widget> lesson;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageViewState();
}

class _MyPageViewState extends ConsumerState<MyPageView> {
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
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: [
                      gapH32,
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.house, color: Colors.white),
                                gapW4,
                                MyText('25', 25),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.house, color: Colors.white),
                                gapW4,
                                MyText('25', 25),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.house, color: Colors.white),
                                gapW4,
                                MyText('25', 25),
                              ],
                            ),
                          ]),
                      Row(
                        children: [
                          Expanded(
                            child: StepProgressIndicator(
                              totalSteps: widget.lesson.length,
                              currentStep: activePage + 1,
                              size: 8,
                              padding: 0,
                              selectedColor: Colors.green,
                              unselectedColor: Colors.grey.shade300,
                              roundedEdges: const Radius.circular(10),
                            ),
                          ),
                          gapW8,
                          MyText('$activePage  / ${widget.lesson.length}', 16),
                        ],
                      ),
                    ],
                  ),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.lesson.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Container(child: widget.lesson[pagePosition]);
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            color: Colors.blueAccent,
            child: ElevatedButton(
              onPressed: (!ref.watch(isDroppedProvider) &&
                      activePage != 0 &&
                      activePage != widget.lesson.length - 1)
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
