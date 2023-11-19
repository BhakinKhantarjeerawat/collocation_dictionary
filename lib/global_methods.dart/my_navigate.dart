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
