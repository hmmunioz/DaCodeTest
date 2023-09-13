import 'package:dacodes_test/app/_childrens/serie/pages/series_page.dart';
import 'package:dacodes_test/app/_childrens/serie/pages/splash_page.dart';
import 'package:flutter/material.dart';

class RouterClass {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (context) => const SplashScreenPage(),
    '/serie': (context) => const SeriesPage(),
  };
}
