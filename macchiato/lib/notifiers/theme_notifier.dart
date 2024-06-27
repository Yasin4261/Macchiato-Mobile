import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  final String _key = 'theme';
  SharedPreferences? _prefs;
  bool _isDarkTheme;

  bool get isDarkTheme => _isDarkTheme;

  ThemeNotifier() : _isDarkTheme = false {
    _loadFromPrefs();
  }

  get isDarkMode => null;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _isDarkTheme = _prefs!.getBool(_key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setBool(_key, _isDarkTheme);
  }
}
