import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChapterExplainPage extends ConsumerWidget {
  const ChapterExplainPage(
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