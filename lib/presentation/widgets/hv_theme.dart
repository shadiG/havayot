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
  final Color gold;

  final String defaultFontFamily;
  final TextStyle primarStyle;

  final List<BoxShadow> shadow;

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
    required this.gold,
    required this.defaultFontFamily,
    required this.primarStyle,
    required this.h1,
    required this.h2,
    required this.thin1,
    required this.shadow,
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
      teal: const Color(0xFF1B8AA5),
      purple: const Color(0xFF3B6DA0),
      blue: const Color(0xFF705598),
      gold: const Color(0xFFE8B70D),

      h1: basicTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        height: adjustTextHeightTo(30.0, 22.0),
      ),
      h2: basicTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        height: adjustTextHeightTo(28.0, 22.0),
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
      ]);
}
