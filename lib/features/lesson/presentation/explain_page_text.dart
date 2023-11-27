import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExplainPageText extends ConsumerWidget {
  const ExplainPageText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [MyText(text, 25)]),
      ),
    );
  }
}
