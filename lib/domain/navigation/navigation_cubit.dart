
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/widgets.dart' as w;
import 'package:havayot/common/hv_cubit.dart';
import 'package:havayot/main.dart';

part 'navigation_cubit.g.dart';

class Routes {
  static const String quest = 'quest';
}

class NavigationCubit extends HvCubit<NavigationModel> {

  NavigationCubit() : super(NavigationModel((b) => b));

  w.NavigatorState get _navigator => HavayotState.navigatorGlobalKey.currentState!;

  void pop([dynamic data]) => _navigator.pop(data);
  void toQuest()  => pushAndClearHistory(Routes.quest);
  
  Future<T?> push<T extends Object?>(String routeName, [Object? arguments]) async {
    await HavayotState.appInitialization;
    return _navigator.pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushAndClearHistory<T extends Object?>(String routeName, [Object? arguments]) async {
    await HavayotState.appInitialization;
    return _navigator.pushNamedAndRemoveUntil(
        routeName, (w.Route<dynamic> route) => false, arguments: arguments);
  }

}

abstract class NavigationModel implements Built<NavigationModel, NavigationModelBuilder> {

  NavigationModel._();
  factory NavigationModel([void Function(NavigationModelBuilder b) updates]) = _$NavigationModel;
  static Serializer<NavigationModel> get serializer => _$navigationModelSerializer;
}