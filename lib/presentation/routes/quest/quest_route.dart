import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/app_component.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_app_bar.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_body.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_bottom_bar.dart';
import 'package:havayot/presentation/routes/quest/widget/question_card.dart';

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
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: MediaQuery.of(context).viewPadding.top + 60.0, bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              return QuestionCard(
                                cubitKey: _cubitKey,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Builder(
                          builder: (context) {
                            return QuestBody(cubitKey: _cubitKey);
                          },
                        ),
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
