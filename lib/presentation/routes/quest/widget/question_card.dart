import 'package:able/able.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/presentation/routes/quest/quest_route_cubit.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_clock.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/utils/color_utils.dart';
import 'package:havayot/presentation/utils/list_utils.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class QuestionCard extends StatelessWidget {
  final GlobalKey cubitKey;

  const QuestionCard({required this.cubitKey, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    const clockSize = 50.0;
    return Builder(
      builder: (context) {
        final questionsF = context.select((QuestRouteCubit value) => value.state.questionsF);

        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: clockSize),
              child: widgetForFetchable(
                context: context,
                fetchable: questionsF,
                buildSuccess: (context, questions) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: QuestionsList(
                      questions: questions,
                      clockSize: clockSize,
                      cubitKey: cubitKey,
                    ),
                  );
                },
                buildError: (context, e) => Text(
                  context.l10n().error__unexpected_error,
                  style: theme.thin1,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Material(
                shape: const CircleBorder(side: BorderSide.none),
                elevation: 8,
                child: Builder(
                  builder: (context) {
                    final countDownF =
                        context.select((QuestRouteCubit value) => value.state.countDownF);
                    return widgetForFetchable(
                      context: context,
                      fetchable: countDownF,
                      buildSuccess: (context, countDown) {
                        return CircleAvatar(
                          radius: clockSize,
                          backgroundColor: theme.green,
                          child: QuestClock(
                            countDown: countDown,
                            initialValue: 0,
                            onCountDownEnd: () {
                              context
                                  .read<QuestRouteCubit>()
                                  .setSelectedChoice(automatically: true);
                            },
                          ),
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
          ],
        );
      },
    );
  }
}

class QuestionsList extends StatefulWidget {
  final GlobalKey cubitKey;
  final BuiltList<Question> questions;
  final double clockSize;

  const QuestionsList({
    super.key,
    required this.cubitKey,
    required this.questions,
    required this.clockSize,
  });

  @override
  State<QuestionsList> createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  late final AppinioSwiperController controller;
  final swiperKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    controller = AppinioSwiperController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);

    final gradients = [
      theme.gold,
      theme.blue,
      theme.red,
      theme.purple,
    ].alternate(widget.questions.length).map((e) => e.toLinearGradient()).toList();

    return Builder(builder: (context) {
      final selectedQuestionF =
          context.select((QuestRouteCubit value) => value.state.selectedQuestionF);
      return widgetForFetchable(
        context: context,
        fetchable: selectedQuestionF,
        buildSuccess: (context, selectedQuestion) {
          return ProgressablesResultPresenter<QuestRouteCubit, QuestRouteModel>(
            presenters: [
              ProgressableResultPresenter(
                progressable: (m) => m.automaticallyGoToNextQuestionP,
                onSuccess: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    controller.swipeRight();
                  });
                },
              ),
            ],
            child: AppinioSwiper(
              key: swiperKey,
              controller: controller,
              cardsCount: widget.questions.length,
              allowUnswipe: false,
              maxAngle: 50,
              padding: EdgeInsets.zero,
              swipeOptions: AppinioSwipeOptions.horizontal,
              onSwipe: (index, __) {
                swipe(index, selectedQuestion);
              },
              onSwiping: (AppinioSwiperDirection direction) {
                debugPrint(direction.toString());
              },
              cardsBuilder: (BuildContext context, int index) {
                final gradient = gradients[index];
                final question = widget.questions[index];

                return _CardView(
                  key: Key('question_card_${question.hashCode}'),
                  question: question,
                  gradient: gradient,
                  paddingTop: widget.clockSize,
                );
              },
            ),
          );
        },
        buildError: (context, e) => Text(
          context.l10n().error__unexpected_error,
          style: theme.thin1,
        ),
      );
    });
  }

  void swipe(int index, Question selectedQuestion) {
    if (index < widget.questions.length) {
      final displayedQuestion = widget.questions[index];
      if (selectedQuestion != displayedQuestion) {
        context.read<QuestRouteCubit>().setSelectedChoice(automatically: false);
      }
    }
  }
}

class _CardView extends StatelessWidget {
  final Question question;
  final Color? color;
  final Gradient? gradient;
  final double paddingTop;

  const _CardView(
      {required this.question, this.color, this.gradient, required this.paddingTop, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: paddingTop + 20, bottom: 0, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          gradient: gradient,
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Expanded(
                child: Text(
                  question.value,
                  style: theme.h1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
