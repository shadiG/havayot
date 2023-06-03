import 'package:able/able.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:havayot/presentation/app_component.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/routes/quest/widget/choice/bullet_choice.dart';
import 'package:havayot/presentation/routes/quest/widget/choice/card_choice.dart';
import 'package:havayot/presentation/routes/quest/widget/grid_list_choices.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_clock.dart';
import 'package:havayot/presentation/routes/quest/widget/vertical_list_choices.dart';
import 'package:havayot/presentation/widgets/hv_divider.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';
import 'package:havayot/presentation/utils/choices_utils.dart';
import 'package:tuple/tuple.dart';

class QuestRoute extends StatefulWidget {
  final AppComponent appComponent;

  const QuestRoute(this.appComponent, {
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
      Tuple2('A', theme.green),
      Tuple2('B', theme.teal),
      Tuple2('C', theme.blue),
      Tuple2('D', theme.purple)
    ];

    return BlocProvider(
      create: (_) =>
          QuestRouteCubit(
            questCubit: widget.appComponent.questCubit,
          ),
      child: Scaffold(
        body: Builder(
          key: _cubitKey,
          builder: (context) {
            final questDurationF =
            context.select((QuestRouteCubit value) => value.state.questDurationF);
            final selectedQuestionF =
            context.select((QuestRouteCubit value) => value.state.selectedQuestionF);
            final selectedChoiceF =
            context.select((QuestRouteCubit value) => value.state.selectedChoiceF);

            return Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: (MediaQuery
                              .of(context)
                              .viewPadding
                              .top + 40),
                        ),
                        widgetForFetchable(
                          context: context,
                          fetchable: questDurationF,
                          buildSuccess: (context, questDuration) {
                            return SizedBox(
                              height: 170,
                              width: 170,
                              child: QuestClock(
                                duration: questDuration,
                                initialDuration: 0,
                                onCountDownEnd: () {
                                  context.read<QuestRouteCubit>().goToNextQuestion();
                                },
                              ),
                            );
                          },
                          buildError: (context, e) =>
                              Text(
                                'Unexpected error',
                                style: theme.thin1,
                              ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        widgetForFetchable(
                          context: context,
                          fetchable: selectedQuestionF,
                          buildSuccess: (context, selectedQuestion) {
                            return Text(
                              selectedQuestion.value,
                              style: theme.h1,
                              textAlign: TextAlign.center,
                            );
                          },
                          buildError: (context, e) =>
                              Text(
                                'Unexpected error',
                                style: theme.thin1,
                              ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        widgetForFetchable(
                          context: context,
                          fetchable: combine2F(f1: selectedQuestionF, f2: selectedChoiceF),
                          buildSuccess: (context, data) {
                            final selectedQuestion = data.item1;
                            final selectedChoice = data.item2;
                            final children = selectedQuestion.choices
                                .mapLettersWithColors(lettersWithColors)
                                .map((choiceWithLetterWithColor) =>
                                CardChoice(
                                  choice: choiceWithLetterWithColor.item1,
                                  letter: choiceWithLetterWithColor.item2,
                                  color: choiceWithLetterWithColor.item3,
                                  selectedChoice: selectedChoice,
                                  onTap: (choice) {
                                    context.read<QuestRouteCubit>().setSelectedChoice(choice);
                                  },
                                ))
                                .toList();
                            return GridListChoices(children: children);
                          },
                          buildError: (context, e) =>
                              Text(
                                'Unexpected error',
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
                    child: Column(
                      children: [
                        HvDivider.horizontal(
                          color: theme.primary2,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text(
                            'Select only one correct answer',
                            style: theme.thin1,
                          ),
                        ),
                      ],
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
