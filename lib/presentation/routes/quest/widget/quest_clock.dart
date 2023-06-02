import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class QuestClock extends StatelessWidget {
  final CountDownController controller;
  final int initialDuration;
  final int duration;

  const QuestClock({
    required this.controller,
    required this.initialDuration,
    required this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return CircularCountDownTimer(
      duration: duration,
      initialDuration: initialDuration,
      controller: controller,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      ringColor: theme.white1,
      ringGradient: null,
      fillColor: theme.primary,
      fillGradient: null,
      backgroundColor: theme.primary,
      backgroundGradient: null,
      strokeWidth: 5.0,
      strokeCap: StrokeCap.round,
      textStyle: theme.h2,
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        debugPrint('Countdown Ended');
      },
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "Commencer";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
