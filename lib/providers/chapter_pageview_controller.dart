import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chapter_pageview_controller.g.dart';

@riverpod
PageController pageController(PageControllerRef ref){
return PageController();
}

