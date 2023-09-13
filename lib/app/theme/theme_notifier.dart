import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeNotifier(this._themeMode);

  getThemeMode() => _themeMode;

  setThemeMode(ThemeMode? mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeMode = mode ??
        (_themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    prefs.setString(
        'themeMode', _themeMode == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }
}
