import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChapterExplainPageView extends ConsumerStatefulWidget {
  const ChapterExplainPageView({super.key, required this.chapters});
  final List<Widget> chapters;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChapterExplainPageViewState();
}

class _ChapterExplainPageViewState
    extends ConsumerState<ChapterExplainPageView> {
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
        body: PageView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.chapters.length,
            // pageSnapping: false,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return widget.chapters[pagePosition];
            }));
  }
}
