import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestCard extends ConsumerStatefulWidget {
  const TestCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestCardState();
}

class _TestCardState extends ConsumerState<TestCard> {
  late FlipCardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 160,
      child: FlipCard(
        controller: _controller,
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        side: CardSide.FRONT, // The side to initially display.
        front: Container(
            height: 300,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              border: Border.all(width: 10, color: Colors.green),
            ),
            // color: Colors.lightBlueAccent,
            child: const Center(child: Text('Front'))),
        back: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              image: DecorationImage(
                  image: AssetImage(Assets.images.beanStalk.path)),
              border: Border.all(width: 10, color: Colors.green),
            ),
            height: 300,
            width: 150,
            // color: Colors.red,
            child: const Center(child: Text('Back'))),
      ),
    );
  }
}
