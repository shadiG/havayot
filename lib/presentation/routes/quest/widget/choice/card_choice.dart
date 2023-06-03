import 'package:flutter/material.dart';
import 'package:havayot/presentation/routes/quest/widget/choice/choice_frame.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';
import 'package:havayot/presentation/widgets/tappable.dart';

class CardChoice extends ChoiceFrame {
  const CardChoice({
    required super.choice,
    required super.selectedChoice,
    required super.onTap,
    required super.color,
    required super.letter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return Tappable(
      key: Key(choice.value),
      child: Card(
        elevation: 6.0,
        shape: const CircleBorder(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(
            child: Text(
              choice.value,
              style: theme.h2.copyWith(
                color: theme.white1,
              ),
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
