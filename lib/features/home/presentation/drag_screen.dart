import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class DragScreen extends StatefulWidget {
  const DragScreen({Key? key}) : super(key: key);
  @override
  DragScreenState createState() => DragScreenState();
}

class DragScreenState extends State<DragScreen> {
  bool insideTarget = false;
  String activeEmoji = '';
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Inside Target? $insideTarget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Draggable<String>(
              data: 'red',
              feedback: SizedBox(
                height: 220.0,
                width: 120.0,
                child: Center(
                  child: Image.asset('assets/images/cat.png'),
                ),
              ),
              child: SizedBox(
                height: 120.0,
                width: 120.0,
                child: Center(
                  child: Image.asset('assets/images/cat.png'),
                ),
              ),
            ),
            LongPressDraggable<String>(
              data: 'blue',
              feedback: SizedBox(
                height: 220.0,
                width: 120.0,
                child: Center(
                  child: Image.asset('assets/images/wood.png'),
                ),
              ),
              child: SizedBox(
                height: 120.0,
                width: 120.0,
                child: Center(
                  child: Image.asset('assets/images/wood.png'),
                ),
              ),
            ),

            DragTarget<String>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return const SizedBox(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Icon(Icons.place_rounded),
                  ),
                );
              },
              onWillAccept: (data) {
                return data == 'red' || data == 'blue';
              },
              onAccept: (data) {
                print(data);
                setState(() {
                  // showSnackBarGlobal(context, 'Dropped successfully!');
                  // _isDropped = true;
                });
              },
              onLeave: (data) {
                debugPrint('mistaked');
              },
            ),

            // DragTarget(

            //   builder: (BuildContext context, List<int> candidateData,
            //       List<dynamic> rejectedData) {
            //     debugPrint(
            //         "candidateData = $candidateData , rejectedData = $rejectedData");
            //     return buildBox("$count", Colors.green[200]);
            //   },
            //   onWillAccept: (data) {
            //     debugPrint("onWillAccept");
            //     return data == 1; // accept when data = 1 only.
            //   },
            //   onAccept: (int data) {
            //     debugPrint("onAccept");
            //     count += data;
            //   },
            //   onLeave: (data) {
            //     debugPrint("onLeave");
            //   },
            // )

            // gapH32,
            // DragTarget<String>(
            //   builder: (context, data, rejectedData) {
            //     return Container(
            //       decoration: ShapeDecoration(
            //           color: Colors.red[300],
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(32))),
            //       height: 150.0,
            //       width: 150.0,
            //       child: activeEmoji == ''
            //           ? null
            //           : FruitBox(activeEmoji, Colors.blue),
            //     );
            //   },
            //   onWillAccept: (emoji) {
            //     return emoji == '🍌' ? false : true;
            //   },
            //   onAccept: (data) {
            //     setState(() {
            //       insideTarget = !insideTarget;
            //       activeEmoji = data;
            //     });
            //   },
            // ),
            // const SizedBox(height: 50.0),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     FruitBox('🍎', Colors.red),
            //     FruitBox('🍌', Colors.green),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class FruitBox extends StatelessWidget {
  final String boxIcon;
  final Color boxColor;

  const FruitBox(this.boxIcon, this.boxColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: boxIcon,
      feedback: Container(
        decoration: ShapeDecoration(
            color: Colors.yellow,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32))),
        height: 120.0,
        width: 120.0,
        child: Center(
            child: Text(boxIcon, style: const TextStyle(fontSize: 50.0))),
      ),
      childWhenDragging: Container(
        decoration: ShapeDecoration(
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32))),
        height: 120.0,
        width: 120.0,
      ),
      child: Container(
        decoration: ShapeDecoration(
            color: boxColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32))),
        height: 120.0,
        width: 120.0,
        child: Center(
            child: Text(boxIcon, style: const TextStyle(fontSize: 50.0))),
      ),
    );
  }
}
