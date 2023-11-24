import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelTestScreen extends ConsumerStatefulWidget {
  const LevelTestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LevelTestScreenState();
}

class _LevelTestScreenState extends ConsumerState<LevelTestScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Level Test Screen')),
    );
  }
}
