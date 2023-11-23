import 'package:collocation_dictionary/common_widgets/my_filled_image.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/home/data/providers.dart';
import 'package:collocation_dictionary/features/home/data/word_repository.dart';
import 'package:collocation_dictionary/features/home/presentation/widgets/search_widgets.dart';
import 'package:collocation_dictionary/features/home/presentation/word_details_screen.dart';
import 'package:collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchField = TextEditingController();

  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _visible = true;
  }

  @override
  Widget build(BuildContext context) {
    final typedText = ref.watch(searchedWordProvider);
    final foundWords = WordRepository().searchWords(word: typedText);
    return Scaffold(
        body: Stack(
      children: [
        const MyFilledImage(imagePath: 'assets/images/water_fall.png'),
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: SingleChildScrollView(
            child: Column(
              children: [
                gapH64,
                SearchWidget(searchField: searchField),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  height: MediaQuery.of(context).size.height - 90,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // final crossAxisSpacing = constraints.maxWidth * 0.05;
                      // final taskWidth =
                      //     (constraints.maxWidth - crossAxisSpacing) / 2.0;
                      // const aspectRatio = 0.82;
                      // final taskHeight = taskWidth / aspectRatio;
                      // Use max(x, 0.1) to prevent layout error when keyword is visible in modal page
                      // final mainAxisSpacing = max(
                      //     (constraints.maxHeight - taskHeight * 3) / 2.0, 0.1);
                      // final tasksLength = foundWords.length;
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: foundWords.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                myNavigate(context,
                                    screen: WordDetailsScreen(index: index));

                    

                                // showMyAlertDialog(
                                //     context: context,
                                //     widget: Column(
                                //       children: [
                                //         Text(foundWords[index].word),
                                //         Text(foundWords[index].sound),
                                //         Text(foundWords[index].meaning),
                                //         Text(foundWords[index].wordType.name),
                                //         Text(foundWords[index]
                                //             .collocations
                                //             .toString()),
                                //       ],
                                //     ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Icon(foundWords[index].iconData,
                                        size: 77, color: Colors.blueGrey),
                                    Text(
                                      foundWords[index].word,
                                      style: const TextStyle(fontSize: 21),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
