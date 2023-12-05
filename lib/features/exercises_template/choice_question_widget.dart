import 'package:collocation_dictionary/common_widgets/alert_dialogs.dart';
import 'package:collocation_dictionary/common_widgets/gradient_button.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ChoiceQuestionWidget> choiceQuestionList = [
  const ChoiceQuestionWidget(
      question: 'คำนามคือ',
      firstChoice: 'คำที่ใช้เรียกคนสัตว์สิ่งของ เช่น จอห์น แมว บ้าน',
      secondChoice: 'คำที่ใช้เรียกการกระทำ เช่น ดู เดิน นั่ง',
      correctAnswer: 1),
  const ChoiceQuestionWidget(
      question: 'ข้อใดถูก',
      firstChoice:
          'เราสามารถจัดประเภทคำนาม  ตามลักษณะที่ สามารถนับได้และนับไม่ได้',
      secondChoice:
          'เราสามารถจัดประเภทคำนาม  ตามลักษณะที่ มีจำนวนเดียว หรือมีจำนวนมากกว่าหนึ่ง',
      thirdChoice: 'ถูกทุกข้อ',
      correctAnswer: 3),
];

class ChoiceQuestionWidget extends ConsumerStatefulWidget {
  const ChoiceQuestionWidget({
    super.key,
    this.imagePath,
    required this.question,
    required this.firstChoice,
    required this.secondChoice,
    this.thirdChoice,
    required this.correctAnswer,
  });
  final String? imagePath;
  final String question;
  final String firstChoice;
  final String secondChoice;
  final String? thirdChoice;
  final int correctAnswer;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChoiceQuestionWidgetState();
}

class _ChoiceQuestionWidgetState extends ConsumerState<ChoiceQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GradientButtonFb4(
          text: 'ตรวจคำตอบ',
          onPressed: () {
            _displayBottomSheet(context);
            // showModalBottomSheet(
            //   context: context,
            //   isScrollControlled: true,
            //   shape: const RoundedRectangleBorder(
            //       borderRadius:
            //           BorderRadius.vertical(top: Radius.circular(20))),
            //   builder: (context) => Center(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         ElevatedButton(
            //             onPressed: () {
            //               Navigator.pop(context);
            //             },
            //             child: const Text('ถัดไป')),
            //       ],
            //     ),
            //   ),
            // );
          }),
      body: Center(
        child: Column(children: [
          gapH48,
          if (widget.imagePath != null) Image.asset(widget.imagePath!),
          gapH16,
          MyText(widget.question, 29),
          gapH32,
          MyBorderButton(text: widget.firstChoice),
          gapH16,
          MyBorderButton(text: widget.secondChoice),
          gapH16,
          // MyBorderButton(text: w),
        ]),
      ),
    );
  }
}

class MyBorderButton extends ConsumerStatefulWidget {
  const MyBorderButton({super.key, required this.text});
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyBorderButtonState();
}

class _MyBorderButtonState extends ConsumerState<MyBorderButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              width: 2,
              color: isPressed
                  ? Colors.grey
                  : const Color.fromARGB(255, 249, 130, 170)),
        ),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: isPressed
                    ? Image.asset(Assets.images.checkGrey.path)
                    : Image.asset(Assets.images.check.path),
                title: Text(
                  widget.text,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 18),
                  // textAlign: TextAlign.center
                ),
              )),
        ),
      ),
    );
  }
}

Future _displayBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.green.shade200,
      // barrierColor: Colors.grey.withOpacity(0.7),
      // isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SizedBox(
            height: 250,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hi ModalBottomSheet!'),
                gapH16,
                GradientButtonFb4(text: 'ถัดไป', onPressed: () {
                  _openAnimatedDialog(context);
                }),
                gapH16,

              ],
            )),
          ));
}

void _openAnimatedDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    transitionBuilder: (context, a1, a2, widget) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: AlertDialog(
            title: const Text("Hi Animation dialog"),
            content: const Text('Nice to meet you'),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      );
    },
  );
}



    //  SizedBox(
    //       height: 55,
    //       width: MediaQuery.of(context).size.width - 32,
    //       child: DecoratedBox(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(16),
    //           // gradient: const LinearGradient(
    //           //     colors: [Color(0xff53E88B), Color(0xff15BE77)])
    //         ),
    //         child: ElevatedButton(
    //           style: ButtonStyle(
    //               elevation: MaterialStateProperty.all(0),
    //               alignment: Alignment.center,
    //               padding: MaterialStateProperty.all(const EdgeInsets.only(
    //                   right: 75, left: 75, top: 15, bottom: 15)),
    //               backgroundColor:
    //                   MaterialStateProperty.all(Colors.transparent),
    //               shape: MaterialStateProperty.all(
                    
    //                 RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(16)),
    //               )),
    //           onPressed: () {},
    //           child: const Text(
    //             'คำนาม สามารถแบ่งได้เป็นทั้งที่ (1)นับได้ (2)นับไม่ได้',
    //             style: TextStyle(color: Colors.blue, fontSize: 21),
    //           ),
    //         ),
    //       ),
    //     ),