import 'package:able/able.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:havayot/domain/navigation/navigation_cubit.dart';

part 'user_cubit.g.dart';

class UserCubit extends AbleCubit<UserModel> {
  final NavigationCubit navigationCubit;

  UserCubit({required this.navigationCubit}) : super(UserModel((b) => b)) {
    // we don't have any user auth but when we would have, we should implement the routing here
    navigationCubit.toQuest();
  }
}

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  UserModel._();

  factory UserModel([void Function(UserModelBuilder b) updates]) = _$UserModel;
  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
