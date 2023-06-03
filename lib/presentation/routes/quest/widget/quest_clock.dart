import 'package:flutter/material.dart';
import 'package:havayot/presentation/routes/quest/widget/countdown/stroke_circular_countdown.dart';
import 'package:havayot/presentation/utils/countdown.dart';

class QuestClock extends StatelessWidget {
  final int initialValue;
  final Countdown countDown;
  final VoidCallback onCountDownEnd;

  const QuestClock({
    required this.initialValue,
    required this.countDown,
    required this.onCountDownEnd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StrokeCircularCountDown(
      initialDuration: initialValue,
      duration: countDown.duration,
      onCountDownEnd: onCountDownEnd,
      
    );
  }
}
