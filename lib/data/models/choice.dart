import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'choice.g.dart';

abstract class Choice implements Built<Choice, ChoiceBuilder> {

  String get value;

  Choice._();
  factory Choice([Function(ChoiceBuilder b) updates]) = _$Choice;
  static Serializer<Choice> get serializer => _$choiceSerializer;
}