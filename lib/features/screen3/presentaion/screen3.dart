import 'package:collocation_dictionary/common_test_widgets/light_dark_widget.dart';
import 'package:collocation_dictionary/features/home/data/tts_provider.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Screen3 extends ConsumerWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InteractiveViewer(
        constrained: false,
        // scaleEnabled: false,
        child: Stack(
          children: [
            Image.asset(Assets.images.largeImage.path),
            Positioned(
                top: 610,
                left: 270,
                // right: 0,
                // bottom: 0,
                child: Opacity(
                    opacity: 0.5,
                    child: Tooltip(
                      decoration: const BoxDecoration(color: Colors.blueAccent),
                      message: 'ทาว เอ่อ|หอคอย',
                      child: ElevatedButton(
                          onPressed: () {
                            ref.read(ttsProvider).speak('tower');
                          },
                          child: const Text('Tower')),
                    ))),
          ],
        ));
  }
}
