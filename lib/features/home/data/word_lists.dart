import 'package:collocation_dictionary/features/home/models/word.dart';
import 'package:collocation_dictionary/features/home/models/word_type.dart';

List<Word> wordList = [
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
      ]),
  Word(
      word: 'keyboard',
      sound: 'คี้ บ็อร์ด',
      meaning: 'คียบอร์ด',
      wordType: WordType.noun,
      collocations: ['type', 'fix', 'buy', 'sell']),
  Word(
      word: 'key',
      sound: 'คี้',
      meaning: 'กุญแจ',
      wordType: WordType.noun,
      collocations: ['insert', 'press', 'save', 'copy']),
];
