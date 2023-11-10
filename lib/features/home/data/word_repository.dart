import 'package:collocation_dictionary/features/home/data/word_lists.dart';
import 'package:collocation_dictionary/features/home/models/word.dart';

class WordRepository {
  List<Word> searchWord({required String word}) {
    return wordList.where((e) => e.word.contains(word)).toList();
  }
}
