import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isHeroProvider = StateProvider<bool>((ref) {
  return false;
});

class HeroAnimation1 extends ConsumerWidget {
  const HeroAnimation1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHero = ref.watch(isHeroProvider);

    return isHero
        ? const SizedBox()
        : const Center(
            child: Hero(
              tag:
                  'unique_tag_for_image', // Make sure this tag is unique for this particular widget.
              child: Icon(Icons.book),
            ),
          );
  }
}

class HeroAnimation2 extends ConsumerWidget {
  const HeroAnimation2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHero = ref.watch(isHeroProvider);
    return !isHero
        ? const SizedBox()
        : const Center(
            child: Hero(
            tag:
                'unique_tag_for_image', // Make sure this tag is unique for this particular widget.
            child: Icon(Icons.book),
          ));
  }
}

class TestHeroAnimation extends ConsumerStatefulWidget {
  const TestHeroAnimation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TestHeroAnimationState();
}

class _TestHeroAnimationState extends ConsumerState<TestHeroAnimation> {
  @override
  Widget build(BuildContext context) {
    final isHero = ref.watch(isHeroProvider);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: const HeroAnimation1()),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: const HeroAnimation2(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: ElevatedButton(
                onPressed: () {
                  ref.read(isHeroProvider.notifier).state = !isHero;
                },
                child: const Text('Change Hero')),
          )
        ],
      ),
    );
  }
}
