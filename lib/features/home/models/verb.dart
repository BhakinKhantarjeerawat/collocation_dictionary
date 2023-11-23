import 'package:collocation_dictionary/features/home/models/word_type.dart';
import 'package:flutter/material.dart';

class Verb {
  Verb(
      {required this.word,
      required this.sound,
      required this.meaning,
      required this.wordType,
      required this.collocations,
      required this.iconData
      });
  final String word;
  final String sound;
  final WordType wordType;
  final String meaning;
  final List<String> collocations;
  final IconData iconData;
}