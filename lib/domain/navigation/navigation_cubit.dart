import 'package:able/able.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/widgets.dart' as w;
import 'package:havayot/main.dart';

part 'navigation_cubit.g.dart';

class Routes {
  static const String quest = 'quest';
  static const String questResult = 'quest-result';
}

class NavigationCubit extends AbleCubit<NavigationModel> {
  NavigationCubit() : super(NavigationModel((b) => b));

  w.NavigatorState get _navigator => HavayotState.navigatorGlobalKey.currentState!;

  void pop([dynamic data]) => _navigator.pop(data);
  void toQuest() => pushAndClearHistory(Routes.quest);
  void toQuestResult() => push(Routes.questResult);

  Future<T?> push<T extends Object?>(String routeName, [Object? arguments]) async {
    await HavayotState.appInitialization;
    return _navigator.pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushAndClearHistory<T extends Object?>(String routeName, [Object? arguments]) async {
    await HavayotState.appInitialization;
    return _navigator.pushNamedAndRemoveUntil(routeName, (w.Route<dynamic> route) => false, arguments: arguments);
  }
}

abstract class NavigationModel implements Built<NavigationModel, NavigationModelBuilder> {
  NavigationModel._();
  factory NavigationModel([void Function(NavigationModelBuilder b) updates]) = _$NavigationModel;
  static Serializer<NavigationModel> get serializer => _$navigationModelSerializer;
}
