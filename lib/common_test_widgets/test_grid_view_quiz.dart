import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestGridViewQuiz extends ConsumerStatefulWidget {
  const TestGridViewQuiz({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TestGridViewQuizState();
}

class _TestGridViewQuizState extends ConsumerState<TestGridViewQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            color: Colors.amber,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Colors.green,
                          child: Column(children: [
                            SizedBox(
                                height:
                                    (MediaQuery.of(context).size.width / 2) -
                                        64,
                                child: Image.asset(
                                  Assets.images.bird.path,
                                  fit: BoxFit.contain,
                                )),
                            const Text('asdf'),
                          ]),
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    (MediaQuery.of(context).size.width / 2) -
                                        64,
                                child: Image.asset(
                                  Assets.images.bird.path,
                                  fit: BoxFit.contain,
                                )),
                            const Text('asdf'),
                          ],
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          SizedBox(
                              height:
                                  (MediaQuery.of(context).size.width / 2) - 64,
                              child: Image.asset(
                                Assets.images.bird.path,
                                fit: BoxFit.contain,
                              )),
                          const Text('asdf'),
                        ]),
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    (MediaQuery.of(context).size.width / 2) -
                                        64,
                                child: Image.asset(
                                  Assets.images.bird.path,
                                  fit: BoxFit.contain,
                                )),
                            const Text('asdf'),
                          ],
                        ),
                      ]),
                ]),
          ),
        ));
  }
}
