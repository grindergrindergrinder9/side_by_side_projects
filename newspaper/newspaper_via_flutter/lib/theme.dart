import 'dart:ui';

import 'package:flutter/widgets.dart';

const String _kPTSerif = 'PT Serif';
const String _kOswald = 'Oswald';

const double kRootFontSize = 16.0;
const double kBodyPadding = 10;
const double kLineHeight = 1.5;

const NewspaperThemeData newspaperThemeData = NewspaperThemeData(
  primary: NewspaperThemeColors.primary,
  background: NewspaperThemeColors.background,
  defaultTextStyle: TextStyle(
      fontFamily: _kPTSerif,
      color: NewspaperThemeColors.primary,
      fontSize: kRootFontSize,
      height: kLineHeight),
  h1: TextStyle(
    fontSize: kRootFontSize * 4,
    // fontWeight: FontWeight.w700,
    height: 1,
    fontVariations: [FontVariation('wght', 700.0)],
    fontFamily: _kOswald,
  ),
  bodyPadding: EdgeInsets.symmetric(
    horizontal: kBodyPadding + 24.0,
    vertical: kBodyPadding,
  ),
);

class NewspaperThemeColors {
  static const primary = Color(0xFF404040);
  static const background = Color(0xFFF9F7F1);
}

class NewspaperTheme extends InheritedWidget {
  const NewspaperTheme({
    super.key,
    required this.themeData,
    required super.child,
  });

  static NewspaperThemeData of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<NewspaperTheme>()!.themeData;
  }

  final NewspaperThemeData themeData;

  @override
  bool updateShouldNotify(covariant NewspaperTheme oldWidget) {
    return oldWidget.themeData != themeData;
  }
}

class NewspaperThemeData {
  const NewspaperThemeData({
    required this.primary,
    required this.background,
    required this.defaultTextStyle,
    required this.h1,
    required this.bodyPadding,
  });

  final Color primary;
  final Color background;
  final TextStyle defaultTextStyle;
  final TextStyle h1;
  final EdgeInsetsGeometry bodyPadding;
}
