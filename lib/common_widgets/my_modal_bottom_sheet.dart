 import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';

Future<dynamic> myModalButtomSheet(BuildContext context) {
    return showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                              height: 160,
                              // width: double.infinity,
                              child: Column(
                                children: [
                                  gapH64,
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    // height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text(
                                            'Button in modalBottomSheet')),
                                  ),
                                  gapH32
                                ],
                              ),
                            ));
  }
