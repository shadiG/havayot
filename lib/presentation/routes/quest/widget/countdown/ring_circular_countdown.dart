import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

import 'countdown_frame.dart';

class RingCircularCountDown extends CountDownFrame {
  const RingCircularCountDown({
    required super.initialDuration,
    required super.duration,
    super.startCountDown,
    required super.onCountDownEnd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    const timeFormat = CountdownTextFormat.MM_SS;
    return CircularCountDownTimer(
      duration: duration,
      initialDuration: initialDuration,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      ringColor: theme.white1,
      ringGradient: null,
      fillColor: theme.primary,
      fillGradient: null,
      backgroundColor: theme.primary,
      backgroundGradient: null,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      textStyle: theme.h2,
      textFormat: timeFormat,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      
      onComplete: () {
        onCountDownEnd.call();
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        return Function.apply(defaultFormatterFunction, [duration]);
      },
    );
  }
}
