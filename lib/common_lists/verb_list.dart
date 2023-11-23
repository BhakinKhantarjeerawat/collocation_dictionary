import 'package:collocation_dictionary/features/home/models/verb.dart';
import 'package:collocation_dictionary/features/home/models/word_type.dart';
import 'package:flutter/material.dart';

List<Verb> verbList = [
  Verb(
      word: 'press',
      sound: 'เพร็ซ',
      meaning: 'กด',
      wordType: WordType.verb,
      collocations: [
        'button',
      ],
      iconData: Icons.computer),  
      Verb(
      word: 'keyboard',
      sound: 'ไท้พ เพอะ',
      meaning: 'พิมพ์',
      wordType: WordType.verb,
      collocations: [
        'keyboard',
      ],
      iconData: Icons.keyboard),  
];
