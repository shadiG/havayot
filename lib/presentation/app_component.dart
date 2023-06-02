import 'package:havayot/data/repositories/quest_repository.dart';
import 'package:havayot/domain/navigation/navigation_cubit.dart';
import 'package:havayot/domain/quest/quest_cubit.dart';
import 'package:havayot/domain/user/user_cubit.dart';
import 'package:havayot/presentation/routes/quest/widget/quest_clock.dart';

class AppComponent {
  final UserCubit userCubit;
  final NavigationCubit navigationCubit;
  final QuestCubit questCubit;

  const AppComponent({
    required this.userCubit,
    required this.navigationCubit,
    required this.questCubit,
  });
}

Future<AppComponent> createAppComponent() async {
  // navigation
  final navigationCubit = NavigationCubit();

  // user cubit
  final userCubit = UserCubit(navigationCubit: navigationCubit);

  //quest repository
  // TODO : for now, we fetch the questions from local
  final questRepository = LocalQuestRepository();

  //quest cubit
  final questCubit = QuestCubit(navigationCubit: navigationCubit, questRepository: questRepository);

  return AppComponent(
    userCubit: userCubit,
    navigationCubit: navigationCubit,
    questCubit: questCubit,
  );
}
