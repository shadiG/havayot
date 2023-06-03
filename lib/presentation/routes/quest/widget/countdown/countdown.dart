import 'package:flutter/material.dart';

abstract class CountDown extends StatelessWidget {
  final int initialDuration;
  final int duration;
  final VoidCallback onCountDownEnd;
  final VoidCallback? startCountDown;

  const CountDown({
    required this.initialDuration,
    required this.duration,
    this.startCountDown,
    required this.onCountDownEnd,
    super.key,
  });
}
