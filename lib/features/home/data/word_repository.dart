import 'package:collocation_dictionary/features/home/data/verb_list.dart';
import 'package:collocation_dictionary/features/home/data/noun_lists.dart';
import 'package:collocation_dictionary/features/home/models/verb.dart';
import 'package:collocation_dictionary/features/home/models/noun.dart';

class WordRepository {
  List<Noun> searchWords({required String word}) {
    return nounList.where((e) => e.word.contains(word)).toList();
  }

  Verb? mapVerb({required String word}) {
    // TODO: 1.try catch 2.solve null problems
    final verb = verbList.where((e) => e.word == word).first;
    if (verb == null) {
      return null;
    } else {
      return verb;
    }
  }
}
