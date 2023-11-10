import 'package:collocation_dictionary/features/home/models/word_type.dart';

class Word {
  Word(
      {required this.word,
      required this.sound,
      required this.meaning,
      required this.wordType,
      required this.collocations});
  final String word;
  final String sound;
  final WordType wordType;
  final String meaning;
  final List<String> collocations;
}
