import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;

  FadeRoute({required this.builder})
      : super(
          pageBuilder: (context, animation, anotherAnimation) => builder(context),
          transitionDuration: const Duration(milliseconds: 1200),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastEaseInToSlowEaseOut,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return FadeTransition(
              opacity: animation,
              child: builder(context),
            );
          },
        );
}