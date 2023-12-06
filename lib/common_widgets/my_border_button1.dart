import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedAnswerProvider = StateProvider<int>((ref) {
  return 0;
});

class MyBorderButton1 extends ConsumerStatefulWidget {
  const MyBorderButton1({super.key, required this.text});
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyBorderButton1State();
}

class _MyBorderButton1State extends ConsumerState<MyBorderButton1> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
          isPressed
              ? ref.read(selectedAnswerProvider.notifier).state = 1
              : ref.read(selectedAnswerProvider.notifier).state = 0;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: isPressed ? Colors.white : Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              width: isPressed ? 2 : 0,
              color: isPressed
                  ? const Color.fromARGB(255, 249, 130, 170)
                  : Colors.grey.shade200),
        ),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                // leading: isPressed
                //     ? Image.asset(Assets.images.check.path)
                //     : Image.asset(Assets.images.checkGrey.path),
                title: Text(widget.text,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )),
        ),
      ),
    );
  }
}

class MyBorderButton2 extends ConsumerStatefulWidget {
  const MyBorderButton2({super.key, required this.text});
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyBorderButton2State();
}

class _MyBorderButton2State extends ConsumerState<MyBorderButton2> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
          isPressed
              ? ref.read(selectedAnswerProvider.notifier).state = 2
              : ref.read(selectedAnswerProvider.notifier).state = 0;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: isPressed ? Colors.white : Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              width: isPressed ? 2 : 0,
              color: isPressed
                  ? const Color.fromARGB(255, 249, 130, 170)
                  : Colors.grey.shade200),
        ),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                // leading: isPressed
                //     ? Image.asset(Assets.images.check.path)
                //     : Image.asset(Assets.images.checkGrey.path),
                title: Text(widget.text,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )),
        ),
      ),
    );
  }
}

class MyBorderButton3 extends ConsumerStatefulWidget {
  const MyBorderButton3({super.key, required this.text});
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyBorderButton3State();
}

class _MyBorderButton3State extends ConsumerState<MyBorderButton3> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
          isPressed
              ? ref.read(selectedAnswerProvider.notifier).state = 3
              : ref.read(selectedAnswerProvider.notifier).state = 0;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: isPressed ? Colors.white : Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              width: isPressed ? 2 : 0,
              color: isPressed
                  ? const Color.fromARGB(255, 249, 130, 170)
                  : Colors.grey.shade200),
        ),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                // leading: isPressed
                //     ? Image.asset(Assets.images.check.path)
                //     : Image.asset(Assets.images.checkGrey.path),
                title: Text(widget.text,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )),
        ),
      ),
    );
  }
}
