import 'package:built_value/built_value.dart';
import 'package:havayot/common/hv_cubit.dart';
import 'package:havayot/domain/navigation/navigation_cubit.dart';

part 'user_cubit.g.dart';

class UserCubit extends HvCubit<UserModel> {
  final NavigationCubit navigationCubit;

  UserCubit({required this.navigationCubit}) : super(UserModel((b) => b)) {
    // we don't have any user auth but when we would have, we should implement the routing here
    navigationCubit.toQuest();
  }
}

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  UserModel._();

  factory UserModel([Function(UserModelBuilder b) updates]) = _$UserModel;
}
