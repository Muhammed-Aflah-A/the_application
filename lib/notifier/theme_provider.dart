import 'package:flutter/material.dart';
import 'package:the_app/utils/theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  var theme = ToggleTheme();
  bool _isDark = false;
  bool get isDark => _isDark;
  ThemeProvider() {
    loadThemeFromSharedPrefs();
  }
  void toggleTheme() {
    _isDark = !_isDark;
    theme.saveTheme(_isDark);
    notifyListeners();
  }

  void loadThemeFromSharedPrefs() async {
    _isDark = await theme.loadTheme();
    notifyListeners();
  }
}
