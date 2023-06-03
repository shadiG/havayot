import 'package:flutter/material.dart';

class L10n {
  static List<Locale> supportedLocales = [
    const Locale(fr, _fr),
  ];

  static const defaultLocale = Locale(fr, _fr);
  
  // languages codes
  static const String fr = 'fr';
  
  
  // languages countries
  static const String _fr = 'FR';
  
}
