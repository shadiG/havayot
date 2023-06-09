import 'package:able/able.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/utils/choices_utils.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

import 'card_choice.dart';

class QuestBody extends StatefulWidget {
  final GlobalKey cubitKey;
  const QuestBody({required this.cubitKey, super.key});

  @override
  State<QuestBody> createState() => _QuestBodyState();
}

class _QuestBodyState extends State<QuestBody> {
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
        final selectedQuestionF = context.select((QuestRouteCubit value) => value.state.selectedQuestionF);

        return widgetForFetchable(
          context: context,
          fetchable: selectedQuestionF,
          buildSuccess: (context, selectedQuestion) {
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 1.4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              children: [
                ...selectedQuestion.choices.mapColors(colors).map(
                  (choiceWithColor) {
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width / 2 - 20),
                      child: CardChoice(
                        choice: choiceWithColor.$1,
                        color: choiceWithColor.$2,
                        onTap: (choice) {
                          widget.cubitKey.currentContext!
                              .read<QuestRouteCubit>()
                              .setSelectedChoice(choice: choice, automatically: true);
                        },
                      ),
                    );
                  },
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
