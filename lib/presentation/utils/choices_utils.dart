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
  BuiltList<Tuple3<Choice, String, Color>> mapLettersWithColors(
      List<Tuple2<String, Color>> letters) {
    assert(length == letters.length);
    return mapIndexed((index, value) => Tuple3(value, letters[index].item1, letters[index].item2))
        .toBuiltList();
  }
}
