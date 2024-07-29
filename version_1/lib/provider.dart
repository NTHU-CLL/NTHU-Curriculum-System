import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isChinese = true;
  bool _darkMode = false;

  bool get isChinese => _isChinese;

  bool get darkMode => _darkMode;

  void toggleLanguage() {
    _isChinese = !_isChinese;
    notifyListeners();
  }

  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}
