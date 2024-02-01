import 'package:fulltimeforce_test/app/_childrens/commits/pages/commits_page.dart';
import 'package:fulltimeforce_test/app/_childrens/commits/pages/splash_page.dart';
import 'package:flutter/material.dart';

class RouterClass {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (context) => const SplashScreenPage(),
    '/commits': (context) => const CommitsPage(),
  };
}
