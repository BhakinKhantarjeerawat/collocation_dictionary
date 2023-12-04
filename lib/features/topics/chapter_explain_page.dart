import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChapterExplainPage extends ConsumerWidget {
  const ChapterExplainPage(
      {super.key,
      required this.title,
      required this.explain1,
      this.explain2,
      this.explain3,
      this.explain4,
      this.imagePath,
      required this.pageNumber,
      this.table});
  final String title;
  final String explain1;
  final String? explain2;
  final String? explain3;
  final String? explain4;

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
              if (imagePath != null)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset(imagePath!),
                ),
              if (table != null)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: table!,
                ),
              MyText(explain1, 21),
              if (explain2 != null) MyInsertableColumn(explain: explain2),
              if (explain3 != null) MyInsertableColumn(explain: explain3),
            ],
          ),
        ),
      ],
    ));
  }
}

class MyInsertableColumn extends StatelessWidget {
  const MyInsertableColumn({
    super.key,
    required this.explain,
  });

  final String? explain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [gapH16, MyText(explain!, 21), gapH16],
    );
  }
}
