import 'package:flutter/material.dart';
import 'package:havayot/presentation/fonts.dart';
import 'package:havayot/presentation/utils/text_height.dart';

class HvTheme extends StatelessWidget {
  const HvTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final HvThemeData data;

  final Widget child;

  static HvThemeData of(BuildContext context) {
    final _InheritedHvTheme inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedHvTheme>()!;
    return inheritedTheme.theme.data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedHvTheme(
      theme: this,
      child: child,
    );
  }
}

class _InheritedHvTheme extends InheritedTheme {
  const _InheritedHvTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final HvTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final _InheritedHvTheme ancestorTheme =
        context.findAncestorWidgetOfExactType<_InheritedHvTheme>()!;
    return identical(this, ancestorTheme) ? child : HvTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedHvTheme old) => theme.data != old.theme.data;
}

class HvThemeData {
  final Color primary;
  final Color secondary;

  final Color primary1;
  final Color primary2;
  final Color white1;
  final Color black;
  final Color green;
  final Color teal;
  final Color blue;
  final Color purple;
  final Color purple1;
  final Color gold;
  final Color red;
  final Color orange;
  final Color grey;

  final String defaultFontFamily;
  final TextStyle primarStyle;

  final List<BoxShadow> shadow;
  final List<BoxShadow> shadow1;

  final TextStyle h1;
  final TextStyle h2;

  final TextStyle thin1;

  HvThemeData({
    required this.primary,
    required this.primary1,
    required this.primary2,
    required this.secondary,
    required this.white1,
    required this.black,
    required this.green,
    required this.teal,
    required this.blue,
    required this.purple,
    required this.purple1,
    required this.orange,
    required this.gold,
    required this.red,
    required this.grey,
    required this.defaultFontFamily,
    required this.primarStyle,
    required this.h1,
    required this.h2,
    required this.thin1,
    required this.shadow,
    required this.shadow1,
  });
}

HvThemeData createHvThemeData(BuildContext context) {
  const defaultFontFamily = Fonts.montserratRegular;
  const white = Color(0xFFFFFFFF);
  const basicTextStyle = TextStyle(fontFamily: defaultFontFamily, color: white);
  return HvThemeData(
    primary: const Color(0xFF001230),
    primary1: const Color(0xFF07A1F1),
    primary2: const Color(0xFF3C4F6E),
    secondary: const Color(0xFF001856),
    defaultFontFamily: defaultFontFamily,
    primarStyle: basicTextStyle,
    white1: white,
    black: const Color(0xFF000000),
    green: const Color(0xFF059C8B),
    teal: const Color(0xFF40E3FA),
    purple: const Color(0xFF5C197E),
    purple1: Colors.purple,
    orange: const Color(0xFFD7710A),
    blue: const Color(0xFF097AC2),
    gold: const Color(0xFFE8B70D),
    red: const Color(0xFF95120C),
    grey: Colors.grey.shade800,
    h1: basicTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      height: adjustTextHeightTo(32.0, 24.0),
    ),
    h2: basicTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 22.0,
      height: adjustTextHeightTo(24.0, 22.0),
    ),
    thin1: basicTextStyle.copyWith(
      fontWeight: FontWeight.w200,
      fontSize: 18.0,
      height: adjustTextHeightTo(24.0, 18.0),
    ),
    shadow: const [
      BoxShadow(
        offset: Offset(0.0, 20.0),
        blurRadius: 80.0,
        color: Color(0xFF001856),
      ),
    ],
    shadow1: const [
      BoxShadow(
        color: Colors.pink,
        offset: Offset(
          1.0,
          1.0,
        ),
        blurRadius: 4.0,
        spreadRadius: 1.0,
      ),
    ],
  );
}
