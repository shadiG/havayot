import 'package:able/able.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/app_component.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/routes/quest/widget/card_choice.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_app_bar.dart';
import 'package:havayot/presentation/routes/quest/widget/question_card.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/utils/choices_utils.dart';
import 'package:havayot/presentation/widgets/hv_divider.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

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

    final colors = [
      theme.gold,
      theme.blue,
      theme.red,
      theme.purple,
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
                          fetchable: selectedQuestionF,
                          buildSuccess: (context, selectedQuestion) {
                            final children = selectedQuestion.choices
                                .mapColors(colors)
                                .map(
                                  (choiceWithColor) => CardChoice(
                                    choice: choiceWithColor.item1,
                                    color: choiceWithColor.item2,
                                    onTap: (choice) {
                                      context.read<QuestRouteCubit>().setSelectedChoice(choice: choice);
                                    },
                                  ),
                                )
                                .toList();
                            return GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              children: children
                                ..map(
                                  (e) => SizedBox(
                                    width: (MediaQuery.of(context).size.width / 2 - 20),
                                    child: e,
                                  ),
                                ),
                            );
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
