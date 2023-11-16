import 'package:collocation_dictionary/common_widgets/my_buttons.dart';
import 'package:collocation_dictionary/common_widgets/my_filled_image.dart';
import 'package:collocation_dictionary/common_widgets/show_text_widget.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/article_list.dart';
import 'package:collocation_dictionary/features/home/data/adjective_list.dart';
import 'package:collocation_dictionary/features/home/data/word_repository.dart';
import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verbProvider = StateProvider<String>((ref) {
  return '';
});

final articleProvider = StateProvider<String>((ref) {
  return '';
});

final adjectiveProvider = StateProvider<String>((ref) {
  return '';
});

final backWordProvider = StateProvider<String>((ref) {
  return '';
});

class WordDetailsScreen extends ConsumerStatefulWidget {
  const WordDetailsScreen({super.key, required this.index});
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WordDetailsScreenState();
}

class _WordDetailsScreenState extends ConsumerState<WordDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final typedText = ref.watch(searchedWordProvider);
    final foundWords = WordRepository().searchWords(word: typedText);
    final verb = ref.watch(verbProvider);
    final article = ref.watch(articleProvider);
    final adjective = ref.watch(adjectiveProvider);

    final backWord = ref.watch(backWordProvider);
    return Scaffold(
      appBar: AppBar(),
        body: Stack(
      children: [
        const MyFilledImage(imagePath: 'assets/images/stream.png'),
        Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                gapH32,
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 70,
                  child: Icon(foundWords[widget.index].iconData,
                      size: 140, color: Colors.blueAccent),
                ),
                gapH16,
                gapH16,
                Row(
                  children: [
                    Container(
                      height: 55,
                      width: 120,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(verb,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue))),
                    ),
                    Expanded(
                      child: Container(
                        height: 55,
                        // width: MediaQuery.of(context).size.width - 32,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                '$article $adjective ${foundWords[widget.index].word}$backWord',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.blue))),
                      ),
                    ),
                  ],
                ),
                gapH16,
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width - 16,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('มองที่หน้าจอมอนิเตอร์',
                          style: TextStyle(fontSize: 18, color: Colors.blue))),
                ),
                gapH16,
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                      // borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Stack(
                      children: [
                        const MyFilledImage(
                            imagePath: 'assets/images/wood.png'),
                        SingleChildScrollView(
                          child: Column(children: [
                            gapH16,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Chip(
                                      label: Text(
                                        foundWords[widget.index].word,
                                        style: const TextStyle(fontSize: 27),
                                      ),
                                    ),
                                  ),
                                  gapW16,
                                  Chip(
                                    label: Text(
                                      foundWords[widget.index].sound,
                                      style: const TextStyle(fontSize: 21),
                                    ),
                                  ),
                                  gapW16,
                                  Chip(
                                    label: Text(
                                      foundWords[widget.index].meaning,
                                      style: const TextStyle(fontSize: 21),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 14,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: foundWords[widget.index]
                                      .collocations
                                      .length,
                                  itemBuilder: (context, index) => Row(
                                        children: [
                                          gapW8,
                                          MyButton21(
                                              text: foundWords[widget.index]
                                                  .collocations[index],
                                              onPressed: () {
                                                ref
                                                    .read(verbProvider.notifier)
                                                    .state = foundWords[
                                                        widget.index]
                                                    .collocations[index];
                                              }),
                                        ],
                                      )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 14,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: articleList.length,
                                  itemBuilder: (context, index) => Row(
                                        children: [
                                          gapW8,
                                          MyButton21(
                                              text: articleList[index],
                                              onPressed: () {
                                                ref
                                                    .read(articleProvider
                                                        .notifier)
                                                    .state = articleList[index];
                                              }),
                                        ],
                                      )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 14,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: adjectiveList.length,
                                  itemBuilder: (context, index) => Row(
                                        children: [
                                          gapW8,
                                          MyButton21(
                                              text: adjectiveList[index],
                                              onPressed: () {
                                                ref
                                                        .read(adjectiveProvider
                                                            .notifier)
                                                        .state =
                                                    adjectiveList[index];
                                              }),
                                        ],
                                      )),
                            ),
                          ]),
                        ),
                      ],
                    )),
              ]),
        ),
      ],
    ));
  }
}
