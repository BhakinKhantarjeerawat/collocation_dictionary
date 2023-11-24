import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

class LocalHeroPage extends StatelessWidget {
  const LocalHeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LocalHeroScope(
          duration: Duration(milliseconds: 30000),
          // curve: Curves.easeInOut,
          child: LocalHeroPlayground(),
        ),
      ),
    );
  }
}

class LocalHeroPlayground extends StatefulWidget {
  const LocalHeroPlayground({super.key});

  @override
  LocalHeroPlaygroundState createState() => LocalHeroPlaygroundState();
}

class LocalHeroPlaygroundState extends State<LocalHeroPlayground> {
  AlignmentGeometry alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: alignment,
              child: const LocalHero(
                tag: 'id',
                child: MyBox(),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              alignment = alignment == Alignment.topLeft
                  ? Alignment.bottomRight
                  : Alignment.topLeft;
            });
          },
          child: const Text('Move'),
        ),
      ],
    );
  }
}

class MyBox extends StatelessWidget {
  const MyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 50,
      height: 50,
    );
  }
}
