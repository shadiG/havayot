import 'package:able/able.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/app_component.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/routes/quest/widget/card_choice.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_app_bar.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_body.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_bottom_bar.dart';
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
    return BlocProvider(
      create: (_) => QuestRouteCubit(
        questCubit: widget.appComponent.questCubit,
      ),
      child: Scaffold(
        body: Builder(
          key: _cubitKey,
          builder: (context) {
            return Stack(
              fit: StackFit.expand,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: QuestAppBar(),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        QuestionCard(
                          cubitKey: _cubitKey,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const QuestBody(),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: QuestBottomBar(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
