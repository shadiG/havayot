import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:havayot/presentation/routes/quest/widget/countdown/countdown.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class StrokeCircularCountDown extends CountDown {
  const StrokeCircularCountDown({
    required super.initialDuration,
    required super.duration,
    super.startCountDown,
    required super.onCountDownEnd,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return TimeCircularCountdown(
      unit: CountdownUnit.second,
      countdownTotal: duration,
      countdownCurrentColor: theme.gold,
      textStyle: theme.h1,
      onFinished: () {
        onCountDownEnd.call();
      },
    );
  }
}
