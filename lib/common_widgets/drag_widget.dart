// import 'package:audioplayers/audioplayers.dart';
import 'package:collocation_dictionary/common_widgets/alert_dialogs.dart';
import 'package:collocation_dictionary/common_widgets/my_curve_container.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/common_widgets/show_snackbar.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/tts_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final isDroppedProvider = StateProvider<bool>((ref) {
  return false;
});

class DragWidget extends ConsumerStatefulWidget {
  const DragWidget(
      {super.key,
      required this.shownWord,
      required this.firstChoice,
      required this.secondChoice,
      required this.answer});
  final String shownWord;
  final String firstChoice;
  final String secondChoice;
  final String answer;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends ConsumerState<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Draggable<String>(
                    data: widget.firstChoice,
                    feedback: Material(
                      color: Colors.blueAccent,
                      child: MyCurveContainer(
                        child: MyText(widget.firstChoice, 34),
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.0,
                      child: MyCurveContainer(
                        child: MyText(widget.firstChoice, 34),
                      ),
                    ),
                    child: InkWell(
                      onLongPress: () => showMyAlertDialog(
                          context: context,
                          widget: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyText('His', 32),
                              gapH16,
                              MyText('ความหมาย: ของเขา', 21)
                              
                            ],
                          )),
                      onTap: () =>
                          ref.read(ttsProvider).speak(widget.firstChoice),
                      child: MyCurveContainer(
                        child: MyText(widget.firstChoice, 34),
                      ),
                    ),
                  ),
                  gapW16,
                  Draggable<String>(
                    data: 'blue',
                    feedback: Material(
                      color: Colors.blueAccent,
                      child: MyCurveContainer(
                        child: MyText(widget.secondChoice, 34),
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.0,
                      child: MyCurveContainer(
                        child: MyText(widget.secondChoice, 34),
                      ),
                    ),
                    child: InkWell(
                      onTap: () =>
                          ref.read(ttsProvider).speak(widget.secondChoice),
                      child: MyCurveContainer(
                        child: MyText(widget.secondChoice, 34),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
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
            width: 90,
            color: Colors.blueAccent,
            child: Center(child: MyText(!isDropped ? '' : widget.answer, 34)),
          ),
        );
      },
      onAccept: (data) async {
        debugPrint(data);
        ref.read(ttsProvider).speak('$data ${widget.staticWord}');
        showSnackBarGlobal(context, 'Correct!');
        ref.read(isDroppedProvider.notifier).state = true;
        setState(() {
          data = data;
        });
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
