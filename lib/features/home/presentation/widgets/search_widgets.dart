import 'package:collocation_dictionary/constants/app_sizes.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.searchField,
              onChanged: (value) => ref
                  .read(searchedWordProvider.notifier)
                  .state = widget.searchField.text,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // focusedBorder: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Colors.white), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Colors.white), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Colors.white), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // suffixIcon: IconButton(
                  //     onPressed: () {
                  //       widget.searchField.clear();
                  //       ref.read(searchedWordProvider.notifier).state = '';
                  //     },
                  //     icon: const Icon(Icons.delete, color: Colors.grey))
                      ),
            ),
          ),
          gapW16,
          InkWell(
            child: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.white),
                iconSize: 55,
                onPressed: () {
                  widget.searchField.clear();
                  ref.read(searchedWordProvider.notifier).state = '';
                }),
          ),
          gapW8,
          IconButton(
              icon: const Icon(Icons.search_outlined, color: Colors.white),
              iconSize: 55,
              onPressed: () {}),
        ],
      ),
    );
  }
}
