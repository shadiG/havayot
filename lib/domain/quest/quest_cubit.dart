import 'package:able/able.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/data/repositories/quest_repository.dart';
import 'package:havayot/domain/navigation/navigation_cubit.dart';
import 'package:havayot/presentation/utils/countdown.dart';
import 'package:rxdart/rxdart.dart';

part 'quest_cubit.g.dart';

class QuestCubit extends AbleCubit<QuestModel> {
  final NavigationCubit navigationCubit;
  final QuestRepository questRepository;

  QuestCubit({
    required this.navigationCubit,
    required this.questRepository,
  }) : super(QuestModel(
          (b) => b
            ..questionsF = Fetchable.idle()
            ..questDurationF = Fetchable.idle()
            ..questionsToPlayF = Fetchable.idle()
            ..countDownF = Fetchable.idle()
            ..selectedQuestionF = Fetchable.idle()
            ..selectedChoiceF = Fetchable.idle()
            ..currentQuestPositionF = Fetchable.idle()
            ..rightChoicesCountF = Fetchable.idle()
            ..goToNextQuestionP = Progressable.idle()
            ..automaticallyGoToNextQuestionP = Progressable.idle()
            ..startQuestP = Progressable.idle(),
        )) {
    emit(state.rebuild((b) => b..questDurationF = Fetchable.success(10)));
    fetchQuestions();
  }

  void startQuest() {
    combine2FStreams(
      s1: stream.startWith(state).map((m) => m.questDurationF).distinct().takeWhileInclusive((m) => !m.success),
      s2: stream.startWith(state).map((m) => m.questionsF).distinct().takeWhileInclusive((m) => !m.success),
    )
        .flatMapOnSuccessFToProgressable((data) {
          final questDuration = data.$1;
          final questions = data.$2;
          final questionsToPlay = questions;
          return futureAsProgressable(() async {
            emit(state.rebuild(
              (b) => b
                ..questionsToPlayF = Fetchable.success(questionsToPlay)
                ..selectedQuestionF = Fetchable.success(questions.first)
                ..countDownF = Fetchable.success(Countdown(duration: questDuration))
                ..selectedChoiceF = Fetchable.success(null)
                ..currentQuestPositionF = Fetchable.success(0)
                ..rightChoicesCountF = Fetchable.success(0),
            ));
          });
        })
        .distinct()
        .takeWhileInclusive((m) => !m.success)
        .presentP(this, (startQuestP) {
          emit(state.rebuild((b) => b..startQuestP = startQuestP));
        });
  }

  void setSelectedChoice(String choice, bool isAutomaticSwipe) {
    emit(state.rebuild((b) => b..selectedChoiceF = Fetchable.success(choice)));
  }

  void goToNextQuestion({bool automatically = false}) {
    combine4FStreams(
      s1: stream.startWith(state).map((m) => m.questionsToPlayF),
      s2: stream.startWith(state).map((m) => m.selectedQuestionF),
      s3: stream.startWith(state).map((m) => m.rightChoicesCountF),
      s4: stream.startWith(state).map((m) => m.selectedChoiceF),
    ).distinct().takeWhileInclusive((m) => !m.success).flatMapOnSuccessFToProgressable((data) {
      final questions = data.$1;
      final selectedQuestion = data.$2;
      final rightChoicesCount = data.$3;
      final selectedChoice = data.$4;

      return futureAsProgressable(() async {
        final nextQuestion = () {
          final currentQuestionIndex = questions.indexWhere((question) => question == selectedQuestion);
          return ((currentQuestionIndex + 1) < questions.length) ? questions[currentQuestionIndex + 1] : null;
        }();
        if (nextQuestion == null) {
          navigationCubit.toQuestResult();
          return;
        }
        final currentRightChoiceCount =
            selectedQuestion.answer == selectedChoice ? rightChoicesCount + 1 : rightChoicesCount;
        final currentQuestPosition = questions.indexWhere((q) => q == nextQuestion);
        emit(state.rebuild(
          (b) => b
            ..selectedQuestionF = Fetchable.success(nextQuestion)
            ..selectedChoiceF = Fetchable.success(null)
            ..currentQuestPositionF = Fetchable.success(currentQuestPosition)
            ..rightChoicesCountF = Fetchable.success(currentRightChoiceCount),
        ));
        _resetQuestCountDown();
      });
    }).presentP(this, (goToNextQuestionP) {
      if (automatically) {
        emit(state.rebuild((b) => b..automaticallyGoToNextQuestionP = goToNextQuestionP));
      } else {
        emit(state.rebuild((b) => b..goToNextQuestionP = goToNextQuestionP));
      }
    });
  }

  void _resetQuestCountDown() {
    stream
        .startWith(state)
        .map((m) => m.questDurationF)
        .distinct()
        .takeWhileInclusive((m) => !m.success)
        .flatMapOnSuccessF((questDuration) => futureAsFetchable(() async => Countdown(duration: questDuration)))
        .presentF(this, (countDownF) {
      emit(state.rebuild((b) => b..countDownF = countDownF));
    });
  }

  void fetchQuestions() {
    futureAsFetchable(() async => await questRepository.getQuestions())
        .takeWhileInclusive((m) => !m.success)
        .presentF(this, (questionsF) {
      emit(state.rebuild((b) => b..questionsF = questionsF));
    });
  }
}

abstract class QuestModel implements Built<QuestModel, QuestModelBuilder> {
  Fetchable<BuiltList<Question>> get questionsF;

  Fetchable<BuiltList<Question>> get questionsToPlayF;

  Fetchable<Countdown> get countDownF;

  Fetchable<Question> get selectedQuestionF;

  Fetchable<String?> get selectedChoiceF;

  Fetchable<int> get currentQuestPositionF;

  Fetchable<int> get rightChoicesCountF;

  Fetchable<int> get questDurationF;

  Progressable get goToNextQuestionP;

  Progressable get automaticallyGoToNextQuestionP;

  Progressable get startQuestP;

  QuestModel._();

  factory QuestModel([void Function(QuestModelBuilder b) updates]) = _$QuestModel;

  static Serializer<QuestModel> get serializer => _$questModelSerializer;
}
