import 'package:collocation_dictionary/common_widgets/my_text_field.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            SearchWidgets(searchField: searchField),
            gapH16,
          ]),
        ));
  }
}

class SearchWidgets extends ConsumerStatefulWidget {
  const SearchWidgets({super.key, required this.searchField});
  final TextEditingController searchField;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchWidgetsState();
}

class _SearchWidgetsState extends ConsumerState<SearchWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: widget.searchField,
              maxLines: 1,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              hintText: 'ค้นหา',
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            height: 50,
            child: OutlinedButton(
                child: const Icon(Icons.search), onPressed: () {}),
          )
        ],
      ),
    );
  }
}

class WordDetails extends ConsumerStatefulWidget {
  const WordDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WordDetailsState();
}

class _WordDetailsState extends ConsumerState<WordDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(children: [
        
      ]),
    ));
  }
}
