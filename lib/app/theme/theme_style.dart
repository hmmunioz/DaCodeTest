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
    primaryColor: ColorsTheme.fulltimeForcePrimary,
    highlightColor: ColorsTheme.fulltimeForceSecondary,
    primaryColorDark: ColorsTheme.fulltimeForceTextBlack,
    primaryColorLight: ColorsTheme.fulltimeForceTextGray,
    hintColor: Colors.black,
    backgroundColor: ColorsTheme.fulltimeForcePrimary.withOpacity(0.5),
    cardColor: ColorsTheme.fulltimeForceSecondary.withOpacity(0.5),
  ),
  ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomTransition(),
        TargetPlatform.iOS: CustomTransition(),
      },
    ),
    fontFamily: 'MarvelRegular',
    hintColor: Colors.white,
    primaryColor: ColorsTheme.fulltimeForcePrimary.withOpacity(0.7),
    highlightColor: ColorsTheme.fulltimeForceSecondary,
    primaryColorDark: ColorsTheme.fulltimeForceTextGray,
    primaryColorLight: ColorsTheme.fulltimeForceTextBlack,
    backgroundColor: Colors.black.withOpacity(0.8),
    cardColor: Colors.black,
  )
];
