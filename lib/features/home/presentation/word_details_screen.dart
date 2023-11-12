import 'package:collocation_dictionary/common_widgets/alert_dialogs.dart';
import 'package:collocation_dictionary/common_widgets/my_filled_image.dart';
import 'package:collocation_dictionary/common_widgets/my_texts.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/word_repository.dart';
import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
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
                  backgroundColor: Colors.white,
                  radius: 70,
                  child: Icon(foundWords[widget.index].iconData,
                      size: 120, color: Colors.blueAccent),
                ),
                gapH32,
                Container(
                    // padding: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      // borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        gapH16,
                        MyText27(
                            text: foundWords[widget.index].word,
                            onPressed: () {
                              // final mapVerb = WordRepository()
                              //     .mapVerb(word: foundWords[widget.index].word);
                              // showMyAlertDialog(
                              //     context: context,
                              //     widget: Column(
                              //       children: [
                              //       if (mapVerb?.iconData != null)  Icon(mapVerb!.iconData),
                              //         Text(mapVerb.word),
                              //         Text(mapVerb.sound),
                              //         Text(mapVerb.meaning),
                              //         Text(mapVerb.collocations.toString()),
                              //       ],
                              //     ));
                            }),
                        MyText21(
                            text: foundWords[widget.index].sound,
                            onPressed: () {}),
                        MyText21(
                            text: foundWords[widget.index].meaning,
                            onPressed: () {}),
                        Wrap(
                          direction: Axis.horizontal,
                          // children: [foundWords[widget.index].collocations],
                          children: List.generate(
                              foundWords[widget.index].collocations.length,
                              (index) => MyText21(
                                  onPressed: () {},
                                  text: foundWords[widget.index]
                                      .collocations[index])),
                        ),
                      ]),
                    )),
              ]),
        ),
      ],
    ));
  }
}
