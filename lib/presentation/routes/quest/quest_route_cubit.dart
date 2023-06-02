import 'package:able/able.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:havayot/common/hv_cubit.dart';
import 'package:havayot/data/models/choice.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/domain/quest/quest_cubit.dart';
import 'package:rxdart/rxdart.dart';

part 'quest_route_cubit.g.dart';

class QuestRouteCubit extends HvCubit<QuestRouteModel> {
  final QuestCubit questCubit;
  final CountDownController countDownController;

  QuestRouteCubit({
    required this.questCubit,
    required this.countDownController,
  }) : super(QuestRouteModel((b) => b
          ..questionsF = Fetchable.idle()
          ..questDurationF = Fetchable.idle()
          ..selectedQuestionF = Fetchable.idle()
          ..selectedChoiceF = Fetchable.idle()
  )) {
    _initQuestDuration();
    _initQuestions();
  }

  void _initQuestDuration() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.questDurationF)
        .distinct()
        .takeWhileInclusive((m) => !m.success)
        .presentF(this, (questDurationF) {
          emit(state.rebuild((b) => b..questDurationF = questDurationF));
        });
  }

  void _initQuestions() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.questionsF)
        .distinct()
        .takeWhileInclusive((m) => !m.success) // we don't want our users to get their question list rebuild while using it
        .presentF(this, (questionsF) {
      emit(state.rebuild((b) => b..questionsF = questionsF));
      if (questionsF.success) {
        _initSelectedQuestion();
      }
    });
  }

  void _initSelectedQuestion() {
    stream
        .startWith(state)
        .map((m) => m.questionsF)
        .distinct()
        .takeWhileInclusive((m) => !m.success)
        .flatMapOnSuccessFToProgressable((questions) => futureAsProgressable(() async {
              countDownController.start();
              emit(state.rebuild((b) => b
                ..selectedQuestionF = Fetchable.success(questions.first)
                ..selectedChoiceF = Fetchable.success(null)));
            }))
        .presentP(this, (selectedQuestionF) {});
  }

  void setSelectedChoice(Choice choice) {
    emit(state.rebuild((b) => b..selectedChoiceF = Fetchable.success(choice)));
  }

  void goToNextQuestion() {
    combine2FStreams(
      s1: stream
          .startWith(state)
          .map((m) => m.questionsF)
          .distinct()
          .takeWhileInclusive((m) => !m.success),
      s2: stream
          .startWith(state)
          .map((m) => m.selectedQuestionF)
          .distinct()
          .takeWhileInclusive((m) => !m.success),
    )
        .distinct()
        .takeWhileInclusive((m) => !m.success)
        .flatMapOnSuccessFToProgressable((data) {
      final questions = data.item1;
      final selectedQuestion = data.item2;

      return futureAsProgressable(() async {
        final nextQuestion = () {
          final currentQuestionIndex =
          questions.indexWhere((question) => question == selectedQuestion);
          return (currentQuestionIndex < questions.length)
              ? questions[currentQuestionIndex+1]
              : questions.first;
        }();
        emit(state.rebuild((b) => b
          ..selectedQuestionF = Fetchable.success(nextQuestion)
          ..selectedChoiceF = Fetchable.success(null)

        ));
        countDownController.restart();
      });
    }).presentP(this, (goToNextQuestionP) {});
  }
}


abstract class QuestRouteModel implements Built<QuestRouteModel, QuestRouteModelBuilder> {
  //question management
  Fetchable<BuiltList<Question>> get questionsF;
  Fetchable<int> get questDurationF;
  Fetchable<Question> get selectedQuestionF;
  Fetchable<Choice?> get selectedChoiceF;
  
  QuestRouteModel._();

  factory QuestRouteModel([void Function(QuestRouteModelBuilder b) updates]) =_$QuestRouteModel;
}
