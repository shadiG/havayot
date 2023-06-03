import 'package:able/able.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:havayot/common/hv_cubit.dart';
import 'package:havayot/data/models/choice.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/domain/quest/quest_cubit.dart';
import 'package:havayot/presentation/utils/countdown.dart';
import 'package:rxdart/rxdart.dart';

part 'quest_route_cubit.g.dart';

class QuestRouteCubit extends HvCubit<QuestRouteModel> {
  final QuestCubit questCubit;

  QuestRouteCubit({
    required this.questCubit,
  }) : super(QuestRouteModel((b) => b
          ..questionsF = Fetchable.idle()
          ..countDownF = Fetchable.idle()
          ..selectedQuestionF = Fetchable.idle()
          ..selectedChoiceF = Fetchable.idle()
          ..currentQuestPositionF = Fetchable.idle()
          ..rightChoicesCountF = Fetchable.idle()
  )) {
    _initRightChoicesCount();
    _initQuestCountDown();
    _initQuestions();
  }

  void _initRightChoicesCount() {
    emit(state.rebuild((b) => b..rightChoicesCountF = Fetchable.success(0)));
  }

  void _initQuestCountDown() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.questDurationF)
        .distinct()
        .takeWhileInclusive((m) => !m.success)
        .flatMapOnSuccessF(
            (questDuration) => futureAsFetchable(() async => Countdown(duration: questDuration)))
        .presentF(this, (countDownF) {
      emit(state.rebuild((b) => b..countDownF = countDownF));
    });
  }

  void _initQuestions() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.questionsF)
        .distinct()
        .takeWhileInclusive((m) =>
            !m.success) // we don't want our users to get their question list rebuild while using it
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
              emit(state.rebuild((b) => b
                ..selectedQuestionF = Fetchable.success(questions.first)
                ..selectedChoiceF = Fetchable.success(null)
                ..currentQuestPositionF = Fetchable.success(0)));
            }))
        .presentP(this, (selectedQuestionF) {});
  }

  void setSelectedChoice(Choice choice) {
    emit(state.rebuild((b) => b..selectedChoiceF = Fetchable.success(choice)));
    goToNextQuestion();
  }

  void goToNextQuestion() {
    combine4FStreams(
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
      s3: stream
          .startWith(state)
          .map((m) => m.rightChoicesCountF)
          .distinct()
          .takeWhileInclusive((m) => !m.success),
      s4: stream
          .startWith(state)
          .map((m) => m.selectedChoiceF)
          .distinct()
          .takeWhileInclusive((m) => !m.success),
    )
        .distinct()
        .takeWhileInclusive((m) => !m.success)
        .flatMapOnSuccessFToProgressable((data) {
      final questions = data.item1;
      final selectedQuestion = data.item2;
      final rightChoicesCount = data.item3;
      final selectedChoice = data.item4;
      
      return futureAsProgressable(() async {
        final nextQuestion = () {
          final currentQuestionIndex =
              questions.indexWhere((question) => question == selectedQuestion);
          return ((currentQuestionIndex + 1) < questions.length)
              ? questions[currentQuestionIndex + 1]
              : questions.first;
        }();
        final currentRightChoiceCount = selectedQuestion.answer == selectedChoice?.value
            ? rightChoicesCount + 1
            : rightChoicesCount;
        emit(state.rebuild((b) => b
          ..selectedQuestionF = Fetchable.success(nextQuestion)
          ..selectedChoiceF = Fetchable.success(null)
          ..currentQuestPositionF =
              Fetchable.success(questions.indexWhere((q) => q == nextQuestion))
          ..rightChoicesCountF = Fetchable.success(currentRightChoiceCount)
        ));
        _initQuestCountDown();
      });
    }).presentP(this, (goToNextQuestionP) {});
  }
}

abstract class QuestRouteModel implements Built<QuestRouteModel, QuestRouteModelBuilder> {
  //question management
  Fetchable<BuiltList<Question>> get questionsF;

  Fetchable<Countdown> get countDownF;

  Fetchable<Question> get selectedQuestionF;

  Fetchable<Choice?> get selectedChoiceF;

  Fetchable<int> get currentQuestPositionF;
  
  Fetchable<int> get rightChoicesCountF;

  QuestRouteModel._();

  factory QuestRouteModel([void Function(QuestRouteModelBuilder b) updates]) = _$QuestRouteModel;
}
