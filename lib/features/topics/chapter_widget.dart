import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChapterWidget extends ConsumerWidget {
  const ChapterWidget({
    super.key,
    this.totalStep,
    this.currentStep,
    required this.imagePath,
    required this.title,
    required this.navigateTo,
  });
  final String title;
  final String imagePath;
  final Widget navigateTo;
  // TODO: possibly implemented:
  final int? totalStep;
  final int? currentStep;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        myNavigate(context, screen: navigateTo);
      },
      leading: Image.asset(imagePath),
      title: Align(alignment: Alignment.topLeft, child: MyText(title, 21)),
    );
  }
}
