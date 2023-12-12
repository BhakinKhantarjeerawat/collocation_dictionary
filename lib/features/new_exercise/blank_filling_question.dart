import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/new_exercise/choice_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isButton1Selected = StateProvider<bool>((ref) {
  return false;
});

final isButton2Selected = StateProvider<bool>((ref) {
  return false;
});

class BlankFillingQuestion extends ConsumerStatefulWidget {
  const BlankFillingQuestion(
      {required this.question,
      required this.correctAnswer,
      required this.choices,
      required this.imagePath,
      super.key});
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final String? imagePath;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BlankFillingQuestionState();
}

class _BlankFillingQuestionState extends ConsumerState<BlankFillingQuestion> {
  final List<String> elevatedButtonList2 = [];
  double opacityLevel = 0.3;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    // double opacityLevel = 0.5;
    // final isBtn1Selected = ref.watch(isButton1Selected);
    // final isBtn2Selected = ref.watch(isButton2Selected);

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(elevatedButtonList2.toString()),
          //
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(children: [
              SizedBox(height: 210, child: Image.asset(widget.imagePath!)),
              MyText(widget.question, 34),
              IconButton(
                  onPressed: () {
                    setState(() {
                      elevatedButtonList2.clear();
                    });
                    ref.read(isButton1Selected.notifier).state = false;
                    ref.read(isButton2Selected.notifier).state = false;
                  },
                  icon: const Icon(Icons.clear)),
              elevatedButtonList2.isEmpty
                  ? const SizedBox()
                  : Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => gapW8,
                        scrollDirection: Axis.horizontal,
                        itemCount: elevatedButtonList2.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                 
                              setState(() {
                                elevatedButtonList2.removeAt(index);
                              });
                            },
                            child: AnimatedOpacity(
                              opacity: opacityLevel,
                              duration: const Duration(seconds: 3),
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  border:
                                      Border.all(width: 2, color: Colors.green),
                                ),
                                child: MyText(elevatedButtonList2[index], 18),
                              ),
                            ),
                          );
                        },
                      )),
            ]),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  WrappedButton1(
                      text: widget.choices[0],
                      onPressed: () {
                        setState(() {
                          elevatedButtonList2.add(widget.choices[0]);
                        });
                        // elevatedButtonList2.join(" ");
                        // ref.read(selectedAnswer1.notifier).state = 
                      }),
                  WrappedButton1(
                      text: widget.choices[1],
                      onPressed: () {
                        setState(() {
                          elevatedButtonList2.add(widget.choices[1]);
                        });
                      }),
                  WrappedButton1(
                      text: widget.choices[2],
                      onPressed: () {
                        setState(() {
                          elevatedButtonList2.add(widget.choices[2]);
                        });
                      }),
                ],
              )
            ]),
          ),
        ]),
      ),
    );
  }
}

class WrappedButton1 extends ConsumerStatefulWidget {
  const WrappedButton1(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  ConsumerState<WrappedButton1> createState() => _WrappedButton1State();
}

class _WrappedButton1State extends ConsumerState<WrappedButton1> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final isWrapButton1Selected = ref.watch(isButton1Selected);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: widget.onPressed,
      child: isWrapButton1Selected
          ? const SizedBox()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                border: Border.all(width: 2, color: Colors.green),
              ),
              child: MyText(widget.text, 18),
            ),
    );
  }
}
