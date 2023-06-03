import 'package:able/able.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_clock.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/utils/color_utils.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    
    const clockSize = 50.0;
    return Builder(
      builder: (context) {
        final countDownF =
            context.select((QuestRouteCubit value) => value.state.countDownF);
        final selectedQuestionF =
            context.select((QuestRouteCubit value) => value.state.selectedQuestionF);

        return widgetForFetchable(
          context: context,
          fetchable: combine2F(f1: countDownF, f2: selectedQuestionF),
          buildSuccess: (context, data) {
            final countDown = data.item1;
            final selectedQuestion = data.item2;

            final cardColor = theme.green.darken();
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: clockSize),
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cardColor,
                      ),
                      padding: const EdgeInsets.only(
                        top: clockSize + 20.0,
                        bottom: 30,
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            selectedQuestion.value,
                            style: theme.h1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Material(
                    shape: const CircleBorder(side: BorderSide.none),
                    elevation: 8,
                    child: CircleAvatar(
                      radius: clockSize,
                      backgroundColor: theme.green,
                      child: QuestClock(
                        countDown: countDown,
                        initialValue: 0,
                        onCountDownEnd: () {
                          context.read<QuestRouteCubit>().goToNextQuestion();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          buildError: (context, e) => Text(
            context.l10n().error__unexpected_error,
            style: theme.thin1,
          ),
        );
      },
    );
  }
}
