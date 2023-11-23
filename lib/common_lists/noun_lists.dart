import 'package:collocation_dictionary/features/home/models/word.dart';
import 'package:collocation_dictionary/features/home/models/word_type.dart';
import 'package:flutter/material.dart';

List<Word> nounList = [
  Word(
      word: 'computer',
      sound: 'ค็อม พิ้ว เทอะ',
      meaning: 'คอมพิวเตอร์',
      wordType: WordType.noun,
      collocations: [
        'open',
        'close',
        'turn on',
        'turn off',
        'fix',
        'buy',
        'sell'
      ],
      iconData: Icons.computer),
  Word(
      word: 'keyboard',
      sound: 'คี้ บ็อร์ด',
      meaning: 'คียบอร์ด',
      wordType: WordType.noun,
      collocations: [
        'type',
        'fix',
        'buy',
        'sell',
        'type',
        'fix',
        'buy',
        'sell',
        'type',
        'fix',
        'buy',
        'sell'
      ],
      iconData: Icons.keyboard),
  Word(
      word: 'key',
      sound: 'คี้',
      meaning: 'กุญแจ',
      wordType: WordType.noun,
      collocations: ['insert', 'press', 'save', 'copy'],
      iconData: Icons.key),
  Word(
      word: 'monitor',
      sound: 'มอนิเตอร์',
      meaning: 'จอภาพ',
      wordType: WordType.noun,
      collocations: ['turn on', 'turn off', 'look at', 'watch', 'adjust'],
      iconData: Icons.monitor),
];
