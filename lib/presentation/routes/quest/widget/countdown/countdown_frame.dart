import 'package:flutter/material.dart';

abstract class CountDownFrame extends StatelessWidget {
  final int initialDuration;
  final int duration;
  final VoidCallback onCountDownEnd;
  final VoidCallback? startCountDown;

  const CountDownFrame({
    required this.initialDuration,
    required this.duration,
    this.startCountDown,
    required this.onCountDownEnd,
    super.key,
  });
}
