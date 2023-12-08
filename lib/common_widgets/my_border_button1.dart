import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final selectedAnswer1 = StateProvider<int>((ref) {
  return 0;
});

final selectedAnswerProvider = StateProvider<String>((ref) {
  return '';
});

final isButton1Selected = StateProvider<bool>((ref) {
  return false;
});

final isButton2Selected = StateProvider<bool>((ref) {
  return false;
});

final isButton3Selected = StateProvider<bool>((ref) {
  return false;
});

class MyBorderButton1 extends ConsumerStatefulWidget {
  const MyBorderButton1({super.key, required this.text});
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyBorderButton1State();
}

class _MyBorderButton1State extends ConsumerState<MyBorderButton1> {
  // bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final isPressed = ref.watch(isButton1Selected);
    return GestureDetector(
      onTap: () {
        setState(() {
          // isPressed = !isPressed;
          ref.read(isButton1Selected.notifier).state = !isPressed;
          ref.read(isButton2Selected.notifier).state = false;
          ref.read(isButton2Selected.notifier).state = false;

          isPressed
              ? ref.read(selectedAnswerProvider.notifier).state = widget.text
              : ref.read(selectedAnswerProvider.notifier).state = '';
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
  // bool isPressed = false;
  @override
  Widget build(BuildContext context) {
        final isPressed = ref.watch(isButton2Selected);
    return GestureDetector(
      onTap: () {
        setState(() {
             ref.read(isButton2Selected.notifier).state = !isPressed;
          ref.read(isButton1Selected.notifier).state = false;
          ref.read(isButton2Selected.notifier).state = false;
          isPressed
              ? ref.read(selectedAnswerProvider.notifier).state = widget.text
              : ref.read(selectedAnswerProvider.notifier).state = '';
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
  // bool isPressed = false;
  @override
  Widget build(BuildContext context) {
        final isPressed = ref.watch(isButton3Selected);
    return GestureDetector(
      onTap: () {
        setState(() {
             ref.read(isButton3Selected.notifier).state = !isPressed;
          ref.read(isButton1Selected.notifier).state = false;
          ref.read(isButton2Selected.notifier).state = false;
          isPressed
              ? ref.read(selectedAnswerProvider.notifier).state = widget.text
              : ref.read(selectedAnswerProvider.notifier).state = '';
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



class MyBorderButton5 extends ConsumerStatefulWidget {
  const MyBorderButton5({super.key, required this.text});
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyBorderButton5State();
}

class _MyBorderButton5State extends ConsumerState<MyBorderButton5> {
  // bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final isPressed = ref.watch(selectedAnswer1) == 1;

    return GestureDetector(
      onTap: () {
        ref.read(selectedAnswer1.notifier).state = 1;
        // setState(() {
        //   isPressed = !isPressed;
        // });
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



class MyBorderButton6 extends ConsumerStatefulWidget {
  const MyBorderButton6({super.key, required this.text});
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyBorderButton6State();
}

class _MyBorderButton6State extends ConsumerState<MyBorderButton6> {
  // bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final isPressed = ref.watch(selectedAnswer1) == 2;

    return GestureDetector(
      onTap: () {
        ref.read(selectedAnswer1.notifier).state = 2;
        // setState(() {
        //   isPressed = !isPressed;
        // });
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



class MyBorderButton7 extends ConsumerStatefulWidget {
  const MyBorderButton7({super.key, required this.text});
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyBorderButton7State();
}

class _MyBorderButton7State extends ConsumerState<MyBorderButton7> {
  // bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final isPressed = ref.watch(selectedAnswer1) == 3;

    return GestureDetector(
      onTap: () {
        ref.read(selectedAnswer1.notifier).state = 3;
        // setState(() {
        //   isPressed = !isPressed;
        // });
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










