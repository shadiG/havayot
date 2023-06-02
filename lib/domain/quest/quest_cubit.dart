import 'package:able/able.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:havayot/common/hv_cubit.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/data/repositories/quest_repository.dart';
import 'package:havayot/domain/navigation/navigation_cubit.dart';

part 'quest_cubit.g.dart';

class QuestCubit extends HvCubit<QuestModel> {
  final NavigationCubit navigationCubit;
  final QuestRepository questRepository;

  QuestCubit({required this.navigationCubit, required this.questRepository})
      : super(QuestModel((b) => b
      ..questionsF = Fetchable.idle()
      ..questDurationF = Fetchable.idle()
  )) {
    emit(state.rebuild((b) => b..questDurationF = Fetchable.success(15)));
    _initQuestions();
  }

  void _initQuestions() {
    futureAsFetchable(() async => await questRepository.getQuestions())
        .presentF(this,
        (questionsF) {
      emit(state.rebuild((b) => b..questionsF = questionsF));
    });
  }
}

abstract class QuestModel implements Built<QuestModel, QuestModelBuilder> {
  Fetchable<BuiltList<Question>> get questionsF;
  Fetchable<int> get questDurationF;
  QuestModel._();

  factory QuestModel([Function(QuestModelBuilder b) updates]) = _$QuestModel;
}
