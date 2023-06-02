import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'choice.dart';

part 'question.g.dart';

abstract class Question implements Built<Question, QuestionBuilder> {

  String get value;
  BuiltList<Choice> get choices;

  Question._();
  factory Question([void Function(QuestionBuilder b) updates]) = _$Question;

  static Serializer<Question> get serializer => _$questionSerializer;
}