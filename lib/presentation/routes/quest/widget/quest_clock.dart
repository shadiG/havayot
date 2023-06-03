import 'package:circular_countdown/circular_countdown.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:havayot/presentation/routes/quest/widget/countdown/ring_circular_countdown.dart';
import 'package:havayot/presentation/routes/quest/widget/countdown/stroke_circular_countdown.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class QuestClock extends StatelessWidget {
  final int initialDuration;
  final int duration;
  final VoidCallback onCountDownEnd;

  const QuestClock({
    required this.initialDuration,
    required this.duration,
    required this.onCountDownEnd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StrokeCircularCountDown(
      initialDuration: initialDuration,
      duration: duration,
      onCountDownEnd: onCountDownEnd,
    );
  }
}
