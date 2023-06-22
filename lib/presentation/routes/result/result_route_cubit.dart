import 'package:able/able.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/domain/navigation/navigation_cubit.dart';
import 'package:havayot/domain/quest/quest_cubit.dart';
import 'package:rxdart/rxdart.dart';

part 'result_route_cubit.g.dart';

class ResultRouteCubit extends AbleCubit<ResultRouteModel> {
  final QuestCubit questCubit;
  final NavigationCubit navigationCubit;

  ResultRouteCubit({
    required this.questCubit,
    required this.navigationCubit,
  }) : super(ResultRouteModel(
          (b) => b
            ..questionsF = Fetchable.idle()
            ..rightChoicesCountF = Fetchable.idle()
            ..startQuestP = Progressable.idle(),
        )) {
    _initRightChoicesCount();
    _initQuestions();
    _initStartQuestP();
  }

  void _initRightChoicesCount() {
    questCubit.stream.startWith(questCubit.state).map((m) => m.rightChoicesCountF).distinct().presentF(this,
        (rightChoicesCountF) {
      emit(state.rebuild((b) => b..rightChoicesCountF = rightChoicesCountF));
    });
  }

  void _initQuestions() {
    questCubit.stream.startWith(questCubit.state).map((m) => m.questionsToPlayF).distinct().presentF(this,
        (questionsF) {
      emit(state.rebuild((b) => b..questionsF = questionsF));
    });
  }

  void _initStartQuestP() {
    questCubit.stream.startWith(questCubit.state).map((m) => m.startQuestP).distinct().presentP(this, (startQuestP) {
      emit(state.rebuild((b) => b..startQuestP = startQuestP));
    });
  }

  void tryAgain() {
    questCubit.startQuest();
    navigationCubit.toQuest();
  }
}

abstract class ResultRouteModel implements Built<ResultRouteModel, ResultRouteModelBuilder> {
  //question management
  Fetchable<BuiltList<Question>> get questionsF;

  Fetchable<int> get rightChoicesCountF;

  Progressable get startQuestP;

  ResultRouteModel._();

  factory ResultRouteModel([void Function(ResultRouteModelBuilder b) updates]) = _$ResultRouteModel;
}
