import 'package:collocation_dictionary/features/home/models/word_type.dart';
import 'package:flutter/material.dart';
class Word {
  Word(
      {required this.word,
      required this.sound,
      required this.meaning,
      required this.wordType,
      required this.collocations,
      this.iconData,
      this.imagePath
      });
  final String word;
  final String sound;
  final WordType wordType;
  final String meaning;
  final List<String> collocations;
  final IconData? iconData;
  final String? imagePath;
}
