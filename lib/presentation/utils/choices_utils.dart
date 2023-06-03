import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:havayot/data/models/choice.dart';
import 'package:havayot/presentation/utils/color_utils.dart';
import 'package:tuple/tuple.dart';

extension ChoicesListExtension on BuiltList<Choice> {

  BuiltList<Tuple3<Choice, String, Color>> mapLettersWithColors(List<Tuple2<String, Color>> letters) {
    assert(length == letters.length);
    return mapIndexed((index, value) => Tuple3(value, letters[index].item1, letters[index].item2.random()))
        .toBuiltList();
  }
}
