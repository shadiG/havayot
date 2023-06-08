import 'package:flutter/material.dart';
import 'package:havayot/domain/navigation/navigation_cubit.dart';
import 'package:havayot/presentation/routes/quest/quest_route.dart';
import 'package:havayot/presentation/routes/result/result_route.dart';

import 'app_component.dart';

Route<dynamic> onGenerateRoute(AppComponent appComponent, RouteSettings settings) {
  switch (settings.name) {
    case Routes.quest:
      return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => QuestRoute(appComponent),
        settings: settings,
      );
    case Routes.questResult:
      return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => QuestResultRoute(appComponent),
        settings: settings,
      );
    default:
      throw StateError('no case for ${settings.name}');
  }
}
