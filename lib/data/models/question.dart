import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'question.g.dart';

abstract class Question implements Built<Question, QuestionBuilder> {
  @BuiltValueField(wireName: 'label')
  String get value;

  @BuiltValueField(wireName: 'options')
  String get options;

  String get answer;

  Question._();
  factory Question([void Function(QuestionBuilder b) updates]) = _$Question;

  static Serializer<Question> get serializer => _$questionSerializer;

  BuiltList<String> get choices => (options
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll('\'', '')
          .split(',')
          .map(
            (e) => e.trim(),
          )
          .toList()
        ..shuffle(
          Random(),
        ))
      .toBuiltList();
}
