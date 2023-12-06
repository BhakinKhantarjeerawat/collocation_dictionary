import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LightDarkThemeWidget extends ConsumerStatefulWidget {
  const LightDarkThemeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LightDarkThemeWidgetState();
}

class _LightDarkThemeWidgetState extends ConsumerState<LightDarkThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(Assets.images.light.path,
            height: double.infinity, fit: BoxFit.cover),
      ]),
    );
  }
}
