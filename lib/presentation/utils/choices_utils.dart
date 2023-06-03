import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:havayot/data/models/choice.dart';
import 'package:havayot/data/models/question.dart';
import 'package:tuple/tuple.dart';

double score(int rightChoiceCount, BuiltList<Question> questions) {
  return (rightChoiceCount / questions.length) * 100;
}


extension ChoicesListExtension on BuiltList<Choice> {
  BuiltList<Tuple2<Choice, Color>> mapColors(List<Color> colors) {
    assert(length == colors.length);
    return mapIndexed((index, value) => Tuple2(value, colors[index])).toBuiltList();
  }
}
