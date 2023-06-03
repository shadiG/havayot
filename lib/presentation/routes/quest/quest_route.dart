import 'package:able/able.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/app_component.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/routes/quest/widget/choice/card_choice.dart';
import 'package:havayot/presentation/routes/quest/widget/grid_list_choices.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_app_bar.dart';
import 'package:havayot/presentation/routes/quest/widget/question_card.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/utils/choices_utils.dart';
import 'package:havayot/presentation/widgets/hv_divider.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';
import 'package:tuple/tuple.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class QuestRoute extends StatefulWidget {
  final AppComponent appComponent;

  const QuestRoute(
    this.appComponent, {
    super.key,
  });

  @override
  State<QuestRoute> createState() => _QuestRouteState();
}

class _QuestRouteState extends State<QuestRoute> {
  final GlobalKey _cubitKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);

    final lettersWithColors = [
      Tuple2('A', theme.gold),
      Tuple2('B', theme.blue),
      Tuple2('C', theme.red),
      Tuple2('D', theme.purple),
    ];

    return BlocProvider(
      create: (_) => QuestRouteCubit(
        questCubit: widget.appComponent.questCubit,
      ),
      child: Scaffold(
        body: Builder(
          key: _cubitKey,
          builder: (context) {
            final selectedQuestionF =
                context.select((QuestRouteCubit value) => value.state.selectedQuestionF);
            final selectedChoiceF =
                context.select((QuestRouteCubit value) => value.state.selectedChoiceF);

            return Stack(
              fit: StackFit.expand,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: QuestAppBar(),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const QuestionCard(),
                        const SizedBox(
                          height: 30,
                        ),
                        widgetForFetchable(
                          context: context,
                          fetchable: combine2F(f1: selectedQuestionF, f2: selectedChoiceF),
                          buildSuccess: (context, data) {
                            final selectedQuestion = data.item1;
                            final selectedChoice = data.item2;
                            final children = selectedQuestion.choices
                                .mapLettersWithColors(lettersWithColors)
                                .map(
                                  (choiceWithLetterWithColor) => CardChoice(
                                    choice: choiceWithLetterWithColor.item1,
                                    letter: choiceWithLetterWithColor.item2,
                                    color: choiceWithLetterWithColor.item3,
                                    selectedChoice: selectedChoice,
                                    onTap: (choice) {
                                      context.read<QuestRouteCubit>().setSelectedChoice(choice);
                                    },
                                  ),
                                )
                                .toList();
                            return GridListChoices(children: children);
                          },
                          buildError: (context, e) => Text(
                            context.l10n().error__unexpected_error,
                            style: theme.thin1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: IntrinsicHeight(
                    child: Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        children: [
                          HvDivider.horizontal(
                            color: theme.primary2,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              context.l10n().quest_screen__bottom_title,
                              style: theme.thin1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
