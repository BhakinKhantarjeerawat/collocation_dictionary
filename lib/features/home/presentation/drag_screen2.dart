// import 'package:audioplayers/audioplayers.dart';
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

class DragScreen2 extends ConsumerStatefulWidget {
  const DragScreen2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DragScreen2State();
}

class _DragScreen2State extends ConsumerState<DragScreen2> {
  final bool _isDropped = false;
  // final String _color = 'blue';
  late AudioPlayer player1;
  late AudioPlayer player2;

  @override
  void initState() {
    super.initState();
    player1 = AudioPlayer();
    player2 = AudioPlayer();
  }

  @override
  void dispose() {
    player1.dispose();
    player2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  // final player1 = AudioPlayer();

                  await player1.setAsset('assets/voices/his.mp3');
                  await player1.play();

                  // final player2 = AudioPlayer();
                  await player2.setAsset('assets/voices/pencil.mp3');
                  await player2.play();
                },
                icon: const Icon(Icons.speaker)),
            IconButton(
                onPressed: () async {
                  // final player1 = AudioPlayer();

                  await player1.setAsset('assets/voices/his_pencil.mp3');
                  await player1.play();

                  // final player2 = AudioPlayer();
                  // await player2.setAsset('assets/voices/pencil.mp3');
                  // await player2.play();
                },
                icon: const Icon(Icons.speaker)),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyDragTarget(staticWord: 'pencil'),
                  MyText(' pen', 34)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Draggable<String>(
                    data: 'his',
                    feedback: Material(
                      color: Colors.blueAccent,
                      child: Container(
                        height: 70.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            'Dragging',
                            textScaleFactor: 2,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: const SizedBox(
                      height: 70.0,
                      width: 160.0,
                      // color: Colors.grey,
                      // child: const Center(
                      //   child: Text(
                      //     'I was here',
                      //     textScaleFactor: 2,
                      //   ),
                      // ),
                    ),
                    child: InkWell(
                      onTap: () => ref.read(ttsProvider).speak('his'),
                      child: Container(
                        height: 70.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(15)),
                        // color: Colors.redAccent,
                        child: const Center(
                          child: Text(
                            'his',
                            textScaleFactor: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  gapW16,
                  Draggable<String>(
                    data: 'blue',
                    feedback: Material(
                      // key: Key('asdf'),
                      color: Colors.green,
                      child: Container(
                        height: 70.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            // color: Colors.green,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            'her',
                            textScaleFactor: 2,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: const SizedBox(
                      height: 70.0,
                      width: 160.0,
                      // color: Colors.grey,
                      // child: const Center(
                      //   child: Text(
                      //     'I was here',
                      //     textScaleFactor: 2,
                      //   ),
                      // ),
                    ),
                    child: GestureDetector(
                      onTap: () => ref.read(ttsProvider).speak('her'),
                      child: Container(
                        height: 70.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)),
                        // color: Colors.green,
                        child: const Center(
                          child: Text(
                            'her',
                            textScaleFactor: 2,
                          ),
                        ),
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
  const MyDragTarget({super.key, required this.staticWord});
  final String staticWord;

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
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          padding: const EdgeInsets.all(6),
          color: Colors.red,
          strokeWidth: 2,
          dashPattern: const [8],
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: 90,
              width: 90,
              color: isDropped ? Colors.blueAccent : null,
              child: Center(
                  child: MyText(!isDropped ? '________' : 'his', 34
                      // textScaleFactor: 1.5,
                      )),
            ),
          ),
        );
      },

      onAccept: (data) async {
        debugPrint(data);
        ref.read(ttsProvider).speak('$data ${widget.staticWord}');
        showSnackBarGlobal(context, 'Dropped successfully!');
        ref.read(isDroppedProvider.notifier).state = true;
        setState(() {
          data = data;
        });
      },
      onWillAccept: (data) {
        if (data != 'his') {
          setState(() {
            ref.read(ttsProvider).speak('wrong');
            showSnackBarGlobal(context, 'wrong');
          });
        }
        return data == 'his';
      },
      // onLeave: (data) {
      //   showSnackBarGlobal(context, 'Missed');
      // },
    );
  }
}
