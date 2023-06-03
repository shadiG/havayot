import 'package:circular_countdown/circular_countdown.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:havayot/presentation/routes/quest/widget/countdown/countdown.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class RingCircularCountDown extends CountDown {
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
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        onCountDownEnd.call();
      },
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        return Function.apply(defaultFormatterFunction, [duration]);
      },
    );
  }
}
