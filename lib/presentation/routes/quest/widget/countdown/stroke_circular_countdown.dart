import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

import 'countdown_frame.dart';

class StrokeCircularCountDown extends CountDownFrame {
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
      key: UniqueKey(),
      unit: CountdownUnit.second,
      countdownTotal: duration,
      countdownCurrentColor: theme.gold,
      gapFactor: 6,
      textStyle: theme.h1,
      onFinished: () {
        onCountDownEnd.call();
      },
    );
  }
}
