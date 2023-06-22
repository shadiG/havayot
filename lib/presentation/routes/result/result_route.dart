import 'package:able/able.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/presentation/app_component.dart';
import 'package:havayot/presentation/routes/result/result_route_cubit.dart';
import 'package:havayot/presentation/routes/result/widget/coin.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/utils/choices_utils.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';
import 'package:havayot/presentation/widgets/tappable.dart';

class QuestResultRoute extends StatefulWidget {
  final AppComponent appComponent;

  const QuestResultRoute(
    this.appComponent, {
    super.key,
  });

  @override
  State<QuestResultRoute> createState() => _QuestResultRouteState();
}

class _QuestResultRouteState extends State<QuestResultRoute> {
  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return BlocProvider(
      create: (context) => ResultRouteCubit(
        questCubit: widget.appComponent.questCubit,
        navigationCubit: widget.appComponent.navigationCubit,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top + 10,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: theme.purple1,
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Text(
                                context.l10n().quest_result_screen__score,
                                style: theme.h2,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Coin(
                                  child: Builder(
                                    builder: (context) {
                                      final questionsF =
                                          context.select((ResultRouteCubit value) => value.state.questionsF);

                                      final rightChoicesCountF =
                                          context.select((ResultRouteCubit value) => value.state.rightChoicesCountF);

                                      return widgetForFetchable(
                                        context: context,
                                        fetchable: combine2F(f1: questionsF, f2: rightChoicesCountF),
                                        buildSuccess: (context, data) {
                                          final questions = data.$1;
                                          final rightChoiceCount = data.$2;
                                          return Text(
                                            '${score(rightChoiceCount, questions)}',
                                            style: theme.h1,
                                          );
                                        },
                                        buildError: (context, e) => Text(
                                          context.l10n().error__unexpected_error,
                                          style: theme.thin1,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: MediaQuery.of(context).viewPadding.bottom + 20),
                      child: Builder(builder: (context) {
                        return Tappable(
                          onTap: () {
                            context.read<ResultRouteCubit>().tryAgain();
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: theme.primary2,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                context.l10n().quest_result_screen__try_again,
                                style: theme.h1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
