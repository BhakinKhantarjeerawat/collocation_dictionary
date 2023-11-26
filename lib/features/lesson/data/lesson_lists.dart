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
    imagePath: 'assets/images/happiness.png',
    activePage: 1,
  ),
  const DragWidget(
    shownWord: 'pen',
    choices: ['my', 'your'],
    answer: 'my',
    translation: 'ปากกาของฉัน',
    activePage: 2,
  ),
  const DragWidget(
    shownWord: 'ปากกา',
    choices: ['ของฉัน', 'ของคุณ'],
    answer: 'ของฉัน',
    translation: 'my pen',
    initStateVoiceText: 'my pen',
    dragTargetRight: true,
    activePage: 3,
  ),
  const DragWidget(
    shownWord: 'books',
    choices: ['thier', 'our'],
    answer: 'our',
    ttsText: 'our books',
    initStateVoiceText: 'our books',
    activePage: 4,
  ),
  const DragWidget(
    shownWord: 'school',
    choices: ['his', 'thier', 'its'],
    answer: 'his',
    activePage: 5,
  ),
  const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    MyText('Pronoun Summary', 25),
    gapH8,
    MyText('คะแนน', 21),
    gapH8,
  ]),
];

List<Widget> pronounLesson1Wrong = [];
