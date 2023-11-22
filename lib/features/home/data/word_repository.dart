import 'package:collocation_dictionary/features/home/data/pronoun_list.dart';
import 'package:collocation_dictionary/features/home/data/verb_list.dart';
import 'package:collocation_dictionary/features/home/data/noun_lists.dart';
import 'package:collocation_dictionary/features/home/models/verb.dart';
import 'package:collocation_dictionary/features/home/models/word.dart';

class WordRepository {
  List<Word> searchWords({required String word}) {
    return nounList.where((e) => e.word.contains(word)).toList();
  }

  Verb? mapVerb({required String word}) {
    try {
      final verb = verbList.where((e) => e.word == word).first;
      return verb;
    } catch (e) {
      throw Exception('where method exception: $e');
    }
  }

  Word? mapPronoun({required String word}) {
    try {
      final pronoun = pronounList.where((e) => e.word == word).first;
      return pronoun;
    } catch (e) {
      throw Exception('where method exception: $e');
    }
  }
}
