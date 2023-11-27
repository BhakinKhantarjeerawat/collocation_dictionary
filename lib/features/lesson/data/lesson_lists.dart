import 'package:collocation_dictionary/common_widgets/drag_widget.dart';
import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/features/lesson/presentation/exercise_intro_page_view.dart';
import 'package:collocation_dictionary/features/lesson/presentation/explain_page_text.dart';
import 'package:collocation_dictionary/features/lesson/presentation/last_exercise_page.dart';
import 'package:flutter/material.dart';

List<Widget> pronounLesson1 = [
  // const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //   MyText('Pronoun', 25),
  //   gapH8,
  //   MyText('คำสรรพนาม/คำแทนคำนาม', 21),
  //   gapH8,
  //   MyText('เช่น ฉัน คุณ เขา เธอ พวกเขา พวกเรา มัน', 21),
  //   gapH32,
  // ]),
  const ExcerciseIntroPageView(explainPages: [
    ExplainPageText('Pronoun = สรรพนาม'),
    ExplainPageText(
      'ใช้แทนชื่อ คน/สัตว์/สิ่งของ\n\nตัวอย่างเช่น\n- ใช้ "เขา" แทน Albert Eistien\n- ใช้ "พวกเรา" แทน จอห์นเคธี่และเพื่อนๆของเธอ',
    ),
    ExplainPageText(
      'จะเห็นว่าคำสรรพนาม ช่วยประหยัดเวลา แทนที่จะพูดชื่อเต็มของ คน สัตว์ สิ่งของ หรือกลุ่มคน นั้นๆ',
    ),
    ExplainPageText(
      'หมายเหตุ\n นอกจากคำสรรพนาม ก็มีคำว่า The ที่ใช้แทนการกล่าวชื่อเต็มได้  เช่น "จังหวัดอุบลราชธานี" (Ubonrachathani province)\nใช้ The ช่วยให้สั้นลงได้เป็น The province ซึ่ง แปลว่าจังหวัดดังกล่าว',
    ),
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
  const LastExcercisePage(lesson: 'Pronoun1'),
];

Set<Widget> pronounLesson1Wrongs = {};
