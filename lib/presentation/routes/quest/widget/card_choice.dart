import 'package:flutter/material.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';
import 'package:havayot/presentation/widgets/tappable.dart';

typedef OnQuestionTabTap = void Function(String);

class CardChoice extends StatelessWidget {
  final String choice;
  final OnQuestionTabTap onTap;
  final Color color;

  const CardChoice({
    required this.choice,
    required this.onTap,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return Tappable(
      key: Key(choice),
      child: Card(
        elevation: 6.0,
        shape: const CircleBorder(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              choice,
              style: theme.h1,
            ),
          ),
        ),
      ),
      onTap: () {
        onTap.call(choice);
      },
    );
  }
}
