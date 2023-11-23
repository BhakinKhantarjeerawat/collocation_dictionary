// import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collocation_dictionary/common_widgets/alert_dialogs.dart';
import 'package:collocation_dictionary/common_widgets/my_curve_container.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/common_widgets/show_snackbar.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/tts_provider.dart';
import 'package:collocation_dictionary/features/home/data/word_repository.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDroppedProvider = StateProvider<bool>((ref) {
  return false;
});

class DragWidget extends ConsumerStatefulWidget {
  const DragWidget(
      {super.key,
      required this.shownWord,
      required this.choices,
      required this.answer,
      this.imagePath,
      this.translation
      });
  final String shownWord;
  final List<String> choices;
  final String answer;
  final String? imagePath;
  final String? translation;


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends ConsumerState<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH32,
            if  (widget.imagePath != null) 
            //  == null
            //     ? const SizedBox()
            //     :
                 SizedBox(
                    height: 180,
                    child: Image.asset(widget.imagePath!),
                  ),
            gapH32,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyDragTarget(
                    staticWord: widget.shownWord, answer: widget.answer),
                SizedBox(
                    // color: Colors.green,
                    height: 90,
                    child: Center(child: MyText(widget.shownWord, 34)))
              ],
            ),
            gapH64,
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: [
                  for (var i in widget.choices) DraggableWidget(data: i),
                ],
              ),
            ),
          ],
        ));
  }
}

class MyDragTarget extends ConsumerStatefulWidget {
  const MyDragTarget(
      {super.key, required this.staticWord, required this.answer});
  final String staticWord;
  final String answer;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyDragTargetState();
}

class _MyDragTargetState extends ConsumerState<MyDragTarget> {
  final String data = '';

  @override
  Widget build(BuildContext context) {
    final isDropped = ref.watch(isDroppedProvider);
    return DragTarget<String>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return DottedBorder(
          // borderType: BorderType.Oval,
          child: Container(
            height: 90,
            width: 140,
            color: Colors.blueAccent,
            child: Center(
                child: AutoSizeText(
              minFontSize: 16,
              !isDropped ? '' : widget.answer,
              style: const TextStyle(fontSize: 34),
              maxLines: 2,
            )),
          ),
        );
      },
      onAccept: (data) async {
        debugPrint(data);
        ref.read(ttsProvider).speak('$data ${widget.staticWord}');
        ref.read(isDroppedProvider.notifier).state = true;
        // setState(() {
        //   data = data;
        // });
        // ref.read(pageControllerProvider).nextPage(
        //     duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      },
      onWillAccept: (data) {
        if (data != widget.answer) {
          setState(() {
            ref.read(ttsProvider).speak('wrong!');
            showSnackBarGlobal(context, 'wrong!');
          });
        }
        return data == widget.answer;
      },
      // onLeave: (data) {
      //   showSnackBarGlobal(context, 'Missed');
      // },
    );
  }
}

class DraggableWidget extends ConsumerWidget {
  const DraggableWidget({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Draggable<String>(
      data: data,
      feedback: Material(
        color: Colors.blueAccent,
        child: MyCurveContainer(
          child: MyText(data, 34),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.0,
        child: MyCurveContainer(
          child: MyText(data, 34),
        ),
      ),
      child: InkWell(
        onTap: () => ref.read(ttsProvider).speak(data),
        onLongPress: () => showMyAlertDialog(
          context: context,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(WordRepository().mapPronoun(word: data)!.word, 32),
              gapH16,
              MyText(WordRepository().mapPronoun(word: data)!.sound, 21),
              gapH16,
              MyText(WordRepository().mapPronoun(word: data)!.meaning, 21)
            ],
          ),
        ),
        child: MyCurveContainer(
          child: MyText(data, 34),
        ),
      ),
    );
  }
}
