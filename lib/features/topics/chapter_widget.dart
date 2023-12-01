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
  final String imagePath;
  final String title;
  final Widget navigateTo;
  final int? totalStep;
  final int? currentStep;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        myNavigatePop(context, screen: navigateTo);
      },
      leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 30,
          child: SizedBox(height: 50, child: Image.asset(imagePath))),
      title: Align(alignment: Alignment.topLeft, child: MyText(title, 21)),
    );
  }
}