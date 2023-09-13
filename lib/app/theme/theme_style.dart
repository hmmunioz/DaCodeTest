import 'package:flutter/material.dart';

import '../common_widgets/custom_transition.dart';
import '../constants/colors.dart';

List<ThemeData> appThemes = [
  ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomTransition(),
        TargetPlatform.iOS: CustomTransition(),
      },
    ),
    fontFamily: 'MarvelRegular',
    primaryColor: ColorsTheme.daCodesPrimary,
    highlightColor: ColorsTheme.daCodesSecondary,
    primaryColorDark: ColorsTheme.daCodesTextBlack,
    primaryColorLight: ColorsTheme.daCodesTextWhite,
    backgroundColor: ColorsTheme.daCodesPrimary.withOpacity(0.5),
    cardColor: ColorsTheme.daCodesSecondary.withOpacity(0.5),
  ),
  ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomTransition(),
        TargetPlatform.iOS: CustomTransition(),
      },
    ),
    fontFamily: 'MarvelRegular',
    primaryColor: ColorsTheme.daCodesPrimary.withOpacity(0.7),
    highlightColor: ColorsTheme.daCodesSecondary,
    primaryColorDark: ColorsTheme.daCodesTextWhite,
    primaryColorLight: ColorsTheme.daCodesTextBlack,
    backgroundColor: Colors.black.withOpacity(0.8),
    cardColor: Colors.black,
  )
];
