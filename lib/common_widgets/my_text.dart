import 'package:collocation_dictionary/common_widgets/alert_dialogs.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/tts_provider.dart';
import 'package:collocation_dictionary/features/home/data/word_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyText extends ConsumerWidget {
  const MyText(
    this.text,
    this.size, {
    this.color,
    super.key,
  });
  final String text;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onDoubleTap: () => ref.read(ttsProvider).speak(text),
      onLongPress: () => showMyAlertDialog(
        context: context,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(WordRepository().mapPronoun(word: text.toLowerCase())!.word,
                32),
            gapH16,
            MyText(WordRepository().mapPronoun(word: text.toLowerCase())!.sound,
                21),
            gapH16,
            MyText(
                WordRepository().mapPronoun(word: text.toLowerCase())!.meaning,
                21)
          ],
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: size, color: color),
        textAlign: TextAlign.left,
      ),
    );
  }
}
