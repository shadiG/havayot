import 'package:flutter/material.dart';
import 'package:havayot/data/models/choice.dart';

typedef OnQuestionTabTap = void Function(Choice);

abstract class ChoiceFrame extends StatelessWidget {
  final Choice choice;
  final Choice? selectedChoice;
  final OnQuestionTabTap onTap;
  final Color color;
  final String letter;

  const ChoiceFrame({
    required this.choice,
    required this.selectedChoice,
    required this.onTap,
    required this.color,
    required this.letter,
    super.key,
  });
}
