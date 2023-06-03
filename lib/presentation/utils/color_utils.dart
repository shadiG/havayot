import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

extension ColorBrightness on Color {
  LinearGradient toLinearGradient({AlignmentGeometry begin = Alignment.centerLeft, AlignmentGeometry end = Alignment.centerRight}) {
    return LinearGradient(
      begin: begin,
      end: end,
      tileMode: TileMode.mirror,
      colors: [this, random()],
    );
  }
  Color random() {
    final random = Random();
    final randomColorValue = random.nextInt(2);
    final toApply = [
      withBlue(randomColorValue),
      withGreen(randomColorValue),
      withRed(randomColorValue)
    ];
    final randomFunctionIndex = random.nextInt(toApply.length);
    return toApply[randomFunctionIndex];
  }

  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
    hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

extension ListColorsExtension on List<Color>{
  BuiltList<Tuple2< String, Color>> mapLettersWithColors(List<String> letters) {
    assert(length == letters.length);
    return mapIndexed((index, value) => Tuple2(letters[index], value))
        .toBuiltList();
  }
}