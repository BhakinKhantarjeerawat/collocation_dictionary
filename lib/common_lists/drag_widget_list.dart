import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:flutter/material.dart';

List<Widget> dragWidgets = [
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
    choices: ['his', 'thier'],
    answer: 'his',
  ),
];
