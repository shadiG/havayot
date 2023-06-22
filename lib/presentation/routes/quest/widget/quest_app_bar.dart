import 'package:able/able.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/utils/questions_utils.dart';
import 'package:havayot/presentation/widgets/animated_progress_bar.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class QuestAppBar extends StatelessWidget {
  const QuestAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);

    return Builder(
      builder: (context) {
        final questionsF = context.select((QuestRouteCubit value) => value.state.questionsF);
        final selectedQuestionF = context.select((QuestRouteCubit value) => value.state.selectedQuestionF);

        final rightChoicesCountF = context.select((QuestRouteCubit value) => value.state.rightChoicesCountF);

        return widgetForFetchable(
          context: context,
          fetchable: combine3F(f1: questionsF, f2: selectedQuestionF, f3: rightChoicesCountF),
          buildSuccess: (context, data) {
            final questions = data.$1;
            final selectedQuestion = data.$2;
            final rightChoicesCount = data.$3;
            final progressBarRatio = selectedQuestion.progression(questions);

            return Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedProgressBar(
                      height: 10,
                      width: MediaQuery.of(context).size.width - 110,
                      backgroundColor: theme.grey,
                      foregrondColor: theme.purple1,
                      ratio: progressBarRatio,
                      direction: Axis.horizontal,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(seconds: 3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: theme.shadow1,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Card(
                    elevation: 4,
                    color: theme.white1,
                    child: IntrinsicHeight(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        margin: const EdgeInsets.only(right: 4),
                        child: Text(
                          '$rightChoicesCount/${questions.length}',
                          style: theme.thin1.copyWith(
                            color: theme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
