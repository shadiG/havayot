import 'package:havayot/data/repositories/quest_repository.dart';
import 'package:havayot/data/services/api/hv_api.dart';
import 'package:havayot/domain/navigation/navigation_cubit.dart';
import 'package:havayot/domain/quest/quest_cubit.dart';
import 'package:havayot/domain/user/user_cubit.dart';

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

  //quest api
  final HvApi api = HvApi.create();
  //quest repository
  final questRepository = CloudQuestRepository(api: api);

  //quest cubit
  final questCubit = QuestCubit(navigationCubit: navigationCubit, questRepository: questRepository);

  return AppComponent(
    userCubit: userCubit,
    navigationCubit: navigationCubit,
    questCubit: questCubit,
  );
}
