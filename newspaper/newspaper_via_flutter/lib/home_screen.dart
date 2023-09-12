import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:newspaper_via_flutter/theme.dart';
import 'package:css_colors/css_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildNewspaperHeader(BuildContext context) {
    final theme = NewspaperTheme.of(context);

    final collapsingPadding = theme.bodyPadding.vertical / 2;
    final double padding =
        (0.67 * theme.h1.fontSize!.toDouble()); // - collapsingPadding;
    final topPadding = padding - collapsingPadding;

    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: padding),
      child: Center(
        child: Text(
          'Newspaper Title'.toUpperCase(),
          style: theme.h1,
        ),
      ),
    );
  }

  Widget _buildPublicationTime(BuildContext context) {
    final theme = NewspaperTheme.of(context);

    const double fontSize = 1.5 * kRootFontSize;
    const BorderSide side = BorderSide(
      width: 3.0,
      style: BorderStyle.solid,
      color: Color(0xFF333333),
    );
    const double padding = 15.0;
    const double lineHeight = 1.5;
    final style = theme.h1.copyWith(
      height: lineHeight,
      fontSize: fontSize,
    );
    const double subFontSize = 0.875 * kRootFontSize;
    final subStyle = style.copyWith(
      fontSize: subFontSize,
      fontWeight: FontWeight.normal,
    );

    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: side, bottom: side),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: padding),
        child: Center(
          child: Text.rich(
            TextSpan(style: style, text: 'Tuesday, 5'.toUpperCase(), children: [
              TextSpan(
                text: 'th ',
                style: subStyle,
              ),
              const TextSpan(text: 'SEPTEMBER 2021'),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = NewspaperTheme.of(context)!;

    return SingleChildScrollView(
      padding: theme.bodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildNewspaperHeader(context),
          _buildPublicationTime(context)
        ],
      ),
    );
  }
}
