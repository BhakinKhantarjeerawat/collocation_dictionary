import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreen1 extends ConsumerStatefulWidget {
  const IntroductionScreen1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IntroductionScreen1State();
}

class _IntroductionScreen1State extends ConsumerState<IntroductionScreen1> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        
      ]
    ));
  }
}
