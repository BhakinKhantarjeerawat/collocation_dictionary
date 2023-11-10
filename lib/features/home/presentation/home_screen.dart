import 'package:collocation_dictionary/common_widgets/my_text_field.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/word_repository.dart';
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
    return Scaffold(
        appBar: AppBar(title: const Text('Home screen')),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            gapH16,
            SearchWidget(searchField: searchField),
            gapH16,
            const WordListWidget()
          ]),
        ));
  }
}

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({
    super.key,
    required this.searchField,
  });

  final TextEditingController searchField;

  @override
  ConsumerState<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: MyTextField(
        //     controller: widget.searchField,
        //     maxLines: 1,
        //     maxLength: 50,
        //     textInputAction: TextInputAction.next,
        //     hintText: 'ค้นหา',
        //   ),
        // ),
        Expanded(
          child: TextField(
            controller: widget.searchField,
            onChanged: (value) => ref
                .read(searchedWordProvider.notifier)
                .state = widget.searchField.text,
          ),
        ),
        const SizedBox(width: 4),
        SizedBox(
          height: 50,
          child: OutlinedButton(
              child: const Icon(Icons.search),
              onPressed: () {
                ref.read(searchedWordProvider.notifier).state =
                    widget.searchField.text;
              }),
        )
      ],
    );
  }
}

class WordListWidget extends ConsumerStatefulWidget {
  const WordListWidget({
    super.key,
  });

  @override
  ConsumerState<WordListWidget> createState() => _WordListWidgetState();
}

class _WordListWidgetState extends ConsumerState<WordListWidget> {
  @override
  Widget build(BuildContext context) {
    final typedText = ref.watch(searchedWordProvider);
    final foundWords = WordRepository().searchWord(word: typedText);

    return (foundWords.isEmpty || typedText == '')
        ? const SizedBox()
        : Expanded(
            child: ListView.builder(
              itemCount: foundWords.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(foundWords[index].word),
                      // Text(foundWords[index].sound),
                      // Text(foundWords[index].meaning),
                      // Text(foundWords[index].collocations),
                      // ExpansionTile(
                      //     backgroundColor: Colors.white,
                      //     title: Text(foundWords[index].word),
                      //     children: const [Text('asdf')]),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
