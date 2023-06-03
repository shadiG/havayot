import 'package:flutter/material.dart';
import 'package:havayot/presentation/routes/quest/widget/choice/choice_frame.dart';
import 'package:havayot/presentation/utils/color_utils.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';
import 'package:havayot/presentation/widgets/tappable.dart';


class BulletChoice extends ChoiceFrame {

  const BulletChoice({
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
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment.centerLeft,
          fit: StackFit.loose,
          children: [
            Tappable(
              child: Container(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 10.0),
                margin: const EdgeInsets.only(
                  left: 60.0,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: color.darken(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    choice.value,
                    style: theme.thin1,
                  ),
                ),
              ),
              onTap: () {
                onTap.call(choice);
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CircledChoiceLead(letter: letter, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class CircledChoiceLead extends StatelessWidget {
  final String letter;
  final Color color;

  const CircledChoiceLead({required this.letter, required this.color, super.key});

  final _size = 70.0;
  final _strokeWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return Card(
      elevation: 3.0,
      shape: const CircleBorder(),
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: _strokeWidth,
          ),
          color: theme.white1,
        ),
        child: Center(
          child: Text(
            letter,
            style: theme.h2.copyWith(
              color: theme.black,
            ),
          ),
        ),
      ),
    );
  }
}
