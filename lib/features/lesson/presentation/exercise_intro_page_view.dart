import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/common_widgets/ny_step_progress.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExcerciseIntroPageView extends ConsumerStatefulWidget {
  const ExcerciseIntroPageView({super.key, required this.explainPages});
  final List<Widget> explainPages;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExcerciseIntroPageViewState();
}

class _ExcerciseIntroPageViewState
    extends ConsumerState<ExcerciseIntroPageView> {
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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close)),
              Expanded(
                  child: MyStepProgress(
                      totalSteps: widget.explainPages.length - 1,
                      currentStep: activePage)),
              gapW8,
              MyText('${activePage + 1}  / ${widget.explainPages.length}', 20),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: PageView.builder(
              itemCount: widget.explainPages.length,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Container(child: widget.explainPages[pagePosition]);
              }),
        ),
        DotsIndicator(
          decorator: const DotsDecorator(),
          dotsCount: widget.explainPages.length,
          position: activePage.toDouble(),
        )
      ],
    );
  }
}
