import 'package:flutter/material.dart';

class GridListChoices extends StatelessWidget {
  final List<Widget> children;

  const GridListChoices({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: children
        ..map(
          (e) => SizedBox(
            width: (MediaQuery.of(context).size.width / 2 - 20),
            child: e,
          ),
        ),
    );
  }
}
