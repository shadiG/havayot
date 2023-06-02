import 'package:flutter/material.dart';
import 'package:havayot/data/models/choice.dart';
import 'package:havayot/presentation/widgets/hv_radio.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';
import 'package:havayot/presentation/widgets/tappable.dart';
typedef OnQuestionTabTap = void Function(Choice);
class QuestionTab extends StatelessWidget {
  final Choice choice;
  final Choice? selectedChoice;
  final OnQuestionTabTap onTap;

  const QuestionTab({
    required this.choice,
    required this.selectedChoice,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return Tappable(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.secondary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: theme.shadow,
        ),
        child: Row(
          children: [
            HvRadio<Choice>(
              value: choice,
              groupValue: selectedChoice,
              onChanged: (value) {},
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              choice.value,
              style: theme.thin1,
            ),
          ],
        ),
      ),
      onTap: () {
        onTap.call(choice);
      },
    );
  }
}
