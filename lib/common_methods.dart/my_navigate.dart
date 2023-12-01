import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void myNavigate(context, {required screen}) {
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.leftToRight,
      child: screen,
    ),
  );
}

void myNavigatePop(context, {required screen}) {
  Navigator.pop(
    context,
    PageTransition(
      duration: const Duration(seconds: 5),
      type: PageTransitionType.rightToLeftWithFade,
      child: screen,
    ),
  );
}

void myNavigateTop(context, {required screen}) {
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.bottomToTop,
      child: screen,
    ),
  );
}
