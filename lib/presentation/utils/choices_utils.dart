import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:havayot/data/models/question.dart';

double score(int rightChoiceCount, BuiltList<Question> questions) {
  return (rightChoiceCount / questions.length) * 100;
}

extension ChoicesListExtension on BuiltList<String> {
  BuiltList<(String, Color)> mapColors(List<Color> colors) {
    assert(length == colors.length);
    return mapIndexed((index, value) => (value, colors[index])).toBuiltList();
  }
}
