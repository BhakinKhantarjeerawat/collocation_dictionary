import 'package:collocation_dictionary/common_test_widgets/light_dark_widget.dart';
import 'package:collocation_dictionary/common_test_widgets/test_flip_card_widget.dart';

import 'package:collocation_dictionary/constants/app_sizes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Second2 extends ConsumerWidget {
  const Second2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          LightDarkThemeWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TestCard(),
                  gapW16,
                  TestCard(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TestCard(),
                  gapW16,
                  TestCard(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
