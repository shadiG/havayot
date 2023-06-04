import 'package:able/able.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/utils/choices_utils.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

import 'card_choice.dart';

class QuestBody extends StatelessWidget {
  const QuestBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    final colors = [
      theme.gold,
      theme.blue,
      theme.red,
      theme.purple,
    ];
    return Builder(
      builder: (context) {
        final selectedQuestionF =
            context.select((QuestRouteCubit value) => value.state.selectedQuestionF);
        return widgetForFetchable(
          context: context,
          fetchable: selectedQuestionF,
          buildSuccess: (context, selectedQuestion) {
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                ...selectedQuestion.choices.mapColors(colors).map(
                      (choiceWithColor) => SizedBox(
                        width: (MediaQuery.of(context).size.width / 2 - 20),
                        child: CardChoice(
                          choice: choiceWithColor.item1,
                          color: choiceWithColor.item2,
                          onTap: (choice) {
                            context.read<QuestRouteCubit>().setSelectedChoice(choice: choice, automatically: true);
                          },
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
