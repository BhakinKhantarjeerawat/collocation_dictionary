import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Pronoun0 extends ConsumerStatefulWidget {
  const Pronoun0({super.key, required this.chapters});
  final List<Widget> chapters;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Pronoun0PageViewState();
}

class _Pronoun0PageViewState extends ConsumerState<Pronoun0> {
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

class PronounIntroWidget extends ConsumerWidget {
  const PronounIntroWidget(
      {super.key,
      required this.title,
      required this.explanations,
      this.imagePath,
      required this.pageNumber,
      this.table});
  final String title;
  final String explanations;
  final String? imagePath;
  final Table? table;
  final int pageNumber;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.white])),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gapH64,
              MyText(title, 29),
              gapH16,
              if (imagePath != null) Image.asset(imagePath!),
              if (table != null) table!,
              MyText(explanations, 21),
            ],
          ),
        ),
      ],
    ));
  }
}
