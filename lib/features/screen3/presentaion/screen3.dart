import 'package:collocation_dictionary/features/home/data/tts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Screen3 extends ConsumerWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: InteractiveViewer(
          constrained: false,
          // scaleEnabled: false,
          child: Stack(
            children: [
              Image.asset('assets/images/large_image.png'),
              Positioned(
                  top: 610,
                  left: 250,
                  // right: 0,
                  // bottom: 0,
                  child: Opacity(
                      opacity: 0.5,
                      child: Tooltip(
                        decoration:
                            const BoxDecoration(color: Colors.blueAccent),
                        message: 'Tower|ทาว เอ่อ|หอคอย',
                        child: ElevatedButton(
                            onPressed: () {
                              ref.read(ttsProvider).speak(
                                  'This is the tower I might visit one day.');
                            },
                            child: const Text('asdf')),
                      ))),
            ],
          )),
    );
  }
}
