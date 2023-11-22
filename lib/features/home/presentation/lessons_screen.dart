import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:collocation_dictionary/features/home/presentation/test_page_view.dart';
import 'package:collocation_dictionary/global_methods.dart/my_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonsScreen extends ConsumerWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: ListView(
      children: [
        ListTile(
            onTap: () => myNavigate(context, screen: const TestPageView()),
            leading: const CircleAvatar(),
            title: const Text('test page view')),
      ],
    ));
  }
}
