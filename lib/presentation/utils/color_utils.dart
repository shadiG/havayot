import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

extension ColorBrightness on Color {
  LinearGradient toLinearGradient({
    AlignmentGeometry begin = Alignment.center,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      tileMode: TileMode.clamp,
      colors: [
        darken(.4),
        lighten(.2),
      ],
    );
  }

  Gradient sweepGradient({AlignmentGeometry alignment = AlignmentDirectional.center}) {
    return SweepGradient(
      center: alignment,
      startAngle: 0.0,
      endAngle: 2 * 3.14,
      colors: [
        lighten(),
        random(),
        darken(),
      ],
    );
  }

  Color random() {
    final random = Random();
    const range = 255;
    final toApply = [
      withBlue(random.nextInt(range)),
      withGreen(random.nextInt(range)),
      withRed(random.nextInt(range))
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
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
