import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:collocation_dictionary/common_widgets/my_liquid_progress.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/tts_provider.dart';
import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/topics/chapter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicsScreen extends ConsumerStatefulWidget {
  const TopicsScreen(
      {super.key,
      required this.cartoonVoicText,
      required this.cartoonImagePath,
      required this.topicName,
      required this.chapterList});
  final String cartoonVoicText;
  final String cartoonImagePath;
  final String topicName;
  final List<ChapterWidget> chapterList;

  @override
  ConsumerState<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends ConsumerState<TopicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Opacity(
          opacity: 0.7,
          child: GestureDetector(
            onDoubleTap: () =>
                ref.read(ttsProvider).speak(widget.cartoonVoicText),
            child: const CircleAvatar(
                radius: 50, child: MyLiquidCircularProgress()),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () =>
                    myNavigatePop(context, screen: const HomeScreen()),
              ),
              centerTitle: true,
              elevation: 0.0,
              pinned: true,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: MyText(
                        widget.topicName,
                        25,
                        color: Colors.blueAccent,
                      )),
                    ],
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.blueAccent, Colors.white])),
                  )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            debugPrint('aaa');
                            myNavigate(context,
                                screen: widget.chapterList[index].navigateTo);
                          },
                          child: widget.chapterList[index]),
                      gapH32
                    ],
                  );
                },
                childCount: widget.chapterList.length,
              ),
            ),
          ],
        ));
  }
}
