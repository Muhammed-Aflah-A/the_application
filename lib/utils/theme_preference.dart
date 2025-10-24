import 'package:shared_preferences/shared_preferences.dart';

class ToggleTheme {
  Future<void> saveTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", value);
  }

  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isDark") ?? false;
  }
}
