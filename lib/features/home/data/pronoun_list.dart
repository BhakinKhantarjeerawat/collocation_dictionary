import 'package:collocation_dictionary/features/home/models/word.dart';
import 'package:collocation_dictionary/features/home/models/word_type.dart';
import 'package:flutter/material.dart';

List<Word> pronounList = [
  Word(
      word: 'his',
      sound: 'ฮิซ',
      meaning: 'ของเขา',
      wordType: WordType.pronoun,
      collocations: [],
      iconData: Icons.tour),
  Word(
      word: 'her',
      sound: 'เฮอ',
      meaning: 'ของเธอ(ผู้หญิง)',
      wordType: WordType.pronoun,
      collocations: [],
      iconData: Icons.tour),
  Word(
      word: 'my',
      sound: 'มาย',
      meaning: 'ของฉัน',
      wordType: WordType.pronoun,
      collocations: [],
      iconData: Icons.tour),
  Word(
      word: 'your',
      sound: 'ยัว',
      meaning: 'ของคุณ (คุณคนเดียวก็ได้ พวกคุณก็ได้)',
      wordType: WordType.pronoun,
      collocations: [],
      iconData: Icons.tour),
];
