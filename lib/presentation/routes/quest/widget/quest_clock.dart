import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:havayot/presentation/utils/countdown.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class QuestClock extends StatelessWidget {
  final int initialValue;
  final Countdown countDown;
  final VoidCallback onCountDownEnd;
  final VoidCallback? startCountDown;

  const QuestClock({
    required this.initialValue,
    required this.countDown,
    this.startCountDown,
    required this.onCountDownEnd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return TimeCircularCountdown(
      key: UniqueKey(),
      unit: CountdownUnit.second,
      countdownTotal: countDown.duration,
      countdownCurrentColor: theme.gold,
      gapFactor: 6,
      textStyle: theme.h1,
      onFinished: () {
        onCountDownEnd.call();
      },
    );
  }
}
