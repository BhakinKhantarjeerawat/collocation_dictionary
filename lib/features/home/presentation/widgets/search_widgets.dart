import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Container(
      padding: const EdgeInsets.only(left: 16),
      width: 180,
      child: TextField(
        controller: widget.searchField,
        onChanged: (value) => ref.read(searchedWordProvider.notifier).state =
            widget.searchField.text,
        decoration:
            InputDecoration(filled: true, fillColor: Colors.grey.shade200),
      ),
    );
  }
}
