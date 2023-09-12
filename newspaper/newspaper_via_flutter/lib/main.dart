import 'package:flutter/material.dart';

import 'theme.dart';
import 'home_screen.dart';

void main() {
  runApp(const NewspaperViaFlutter());
}

class NewspaperViaFlutter extends StatelessWidget {
  const NewspaperViaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = newspaperThemeData;
    return NewspaperTheme(
      themeData: theme,
      child: DefaultTextStyle(
        style: theme.defaultTextStyle,
        textHeightBehavior: const TextHeightBehavior(
          leadingDistribution: TextLeadingDistribution.even,
        ),
        child: ColoredBox(
          color: theme.background,
          child: WidgetsApp(
            debugShowCheckedModeBanner: false,
            builder: (BuildContext context, Widget? navigator) =>
                const HomeScreen(),
            // textStyle: theme.defaultTextStyle,
            color: theme.primary,
          ),
        ),
      ),
    );
  }
}
