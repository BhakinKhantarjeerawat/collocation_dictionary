import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';

List<Widget> pronounLesson1 = [
  const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    MyText('Pronoun', 25),
    gapH8,
    MyText('คำสรรพนาม/คำแทนคำนาม', 21),
    gapH8,
    MyText('เช่น ฉัน คุณ เขา เธอ พวกเขา พวกเรา มัน', 21),
  ]),
  const DragWidget(
    shownWord: 'pencil',
    choices: ['his', 'her', 'our'],
    answer: 'his',
  ),
  const DragWidget(
    shownWord: 'pen',
    choices: ['my', 'your'],
    answer: 'my',
  ),
  const DragWidget(
    shownWord: 'books',
    choices: ['thier', 'our'],
    answer: 'our',
  ),
  const DragWidget(
    shownWord: 'school',
    choices: ['his', 'thier', 'its'],
    answer: 'his',
  ),
  const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    MyText('Pronoun Summary', 25),
    gapH8,
    MyText('คะแนน', 21),
    gapH8,
    // MyText('${pronounLesson1.length}', 21),
  ]),
];
