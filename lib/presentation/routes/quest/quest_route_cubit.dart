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
    ..currentQuestPositionF = Fetchable.idle()
    ..rightChoicesCountF = Fetchable.idle()
    ..goToNextQuestionP = Progressable.idle()
    ..automaticallyGoToNextQuestionP = Progressable.idle()
  )) {
    questCubit.startQuest();
    _initRightChoicesCount();
    _initQuestCountDown();
    _initQuestions();
    _initSelectedQuestion();
    _initCurrentQuestPosition();
    _initGoToNextQuestionP();
    _initautomaticallyGoToNextQuestionP();
  }

  void _initautomaticallyGoToNextQuestionP() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.automaticallyGoToNextQuestionP)
        .distinct()
        .presentP(this, (automaticallyGoToNextQuestionP) {
      emit(state.rebuild((b) => b..automaticallyGoToNextQuestionP = automaticallyGoToNextQuestionP));
    });
  }

  void _initGoToNextQuestionP() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.goToNextQuestionP)
        .distinct()
        .presentP(this, (goToNextQuestionP) {
      emit(state.rebuild((b) => b..goToNextQuestionP = goToNextQuestionP));
    });
  }

  void _initRightChoicesCount() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.rightChoicesCountF)
        .distinct()
        .presentF(this, (rightChoicesCountF) {
      emit(state.rebuild((b) => b..rightChoicesCountF = rightChoicesCountF));
    });
  }

  void _initQuestCountDown() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.countDownF)
        .distinct()
        .presentF(this, (countDownF) {
      emit(state.rebuild((b) => b..countDownF = countDownF));
    });
  }

  void _initQuestions() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.questionsToPlayF)
        .distinct()
        .presentF(this, (questionsF) {
      emit(state.rebuild((b) => b..questionsF = questionsF));
    });
  }

  void _initSelectedQuestion() {
    questCubit.stream
        .startWith(questCubit.state)
        .map((m) => m.selectedQuestionF)
        .distinct()
        .presentF(this, (selectedQuestionF) {
      emit(state.rebuild((b) => b..selectedQuestionF = selectedQuestionF));
    });
  }

  void setSelectedChoice({Choice? choice, required automatically}) {
    if (choice != null) {
      questCubit.setSelectedChoice(choice, false);
    }
    //questCubit.goToNextQuestion(automatically: automatically);
  }

  void _initCurrentQuestPosition() {
    stream
        .startWith(state)
        .map((m) => m.currentQuestPositionF)
        .distinct()
        .presentF(this, (currentQuestPositionF) {
      emit(state.rebuild((b) => b..currentQuestPositionF = currentQuestPositionF));
    });
  }
}

abstract class QuestRouteModel implements Built<QuestRouteModel, QuestRouteModelBuilder> {
  //question management
  Fetchable<BuiltList<Question>> get questionsF;

  Fetchable<Countdown> get countDownF;

  Fetchable<Question> get selectedQuestionF;
  
  Fetchable<int> get currentQuestPositionF;
  
  Fetchable<int> get rightChoicesCountF;
  
  Progressable get goToNextQuestionP;

  Progressable get automaticallyGoToNextQuestionP;


  QuestRouteModel._();

  factory QuestRouteModel([void Function(QuestRouteModelBuilder b) updates]) = _$QuestRouteModel;
}
