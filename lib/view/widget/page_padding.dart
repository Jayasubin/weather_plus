import 'package:flutter/material.dart';

class PagePadding extends StatelessWidget {
  const PagePadding({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      child: child,
    );
  }
}
