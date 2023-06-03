import 'package:flutter/material.dart';

class VerticalListChoices extends StatelessWidget {
  final List<Widget> children;

  const VerticalListChoices({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
    );
  }
}
