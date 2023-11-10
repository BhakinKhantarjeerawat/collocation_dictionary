import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/word_repository.dart';
import 'package:collocation_dictionary/features/home/presentation/widgets/search_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchedWordProvider = StateProvider<String>((ref) {
  return '';
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final typedText = ref.watch(searchedWordProvider);
    final foundWords = WordRepository().searchWord(word: typedText);
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/water_fall.png',
                  // fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            gapH64,
            SearchWidget(searchField: searchField),
            Center(
              child: SizedBox(
                  height: 700,
                  width: MediaQuery.of(context).size.width - 32,
                  child: GridView.builder(
                    itemCount: foundWords.length,
                    itemBuilder: (context, index) {
                      return (foundWords.isEmpty || typedText == '')
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                // color: Colors.white,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      const Icon(Icons.key, size: 50),
                                      gapH8,
                                      Text(
                                        foundWords[index].word,
                                        key: Key('text_$index'),
                                        style: const TextStyle(
                                            fontSize: 21, color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 32,
                      crossAxisSpacing: 32,
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                    ),
                  )),
            )
          ]),
        ],
      ),
    ));
  }
}

// class WordListWidget extends ConsumerStatefulWidget {
//   const WordListWidget({
//     super.key,
//   });

//   @override
//   ConsumerState<WordListWidget> createState() => _WordListWidgetState();
// }

// class _WordListWidgetState extends ConsumerState<WordListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final typedText = ref.watch(searchedWordProvider);
//     final foundWords = WordRepository().searchWord(word: typedText);

//     return (foundWords.isEmpty || typedText == '')
//         ? const SizedBox()
//         : Align(
//             alignment: Alignment.topLeft,
//             child: SizedBox(
//               width: 180,
//               height: MediaQuery.of(context).size.height - 160,
//               child: ListView.builder(
//                 itemCount: foundWords.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {},
//                     child: Card(
//                       child: Row(
//                         children: [
//                           gapW16,
//                           const Icon(
//                             Icons.computer,
//                             color: Colors.blueAccent,
//                             size: 50,
//                           ),
//                           gapW16,
//                           Text(foundWords[index].word),
//                           // Text(foundWords[index].sound),
//                           // Text(foundWords[index].meaning),
//                           // Text(foundWords[index].collocations),
//                           // ExpansionTile(
//                           //     backgroundColor: Colors.white,
//                           //     title: Text(foundWords[index].word),
//                           //     children: const [Text('asdf')]),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//   }
// }

// class ItemTile extends ConsumerWidget {
//   final int itemNo;

//   const ItemTile(this.itemNo, {super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final typedText = ref.watch(searchedWordProvider);
//     final foundWords = WordRepository().searchWord(word: typedText);
//     return (foundWords.isEmpty || typedText == '')
//         ? const SizedBox()
//         : Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Card(
//               child: Text(
//                 foundWords[index].word,
//                 key: Key('text_$itemNo'),
//               ),
//             ),
//           );
//   }
// }
