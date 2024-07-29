import 'config.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _darkMode = false;
  DeviceScreen _deviceScreen = DeviceScreen.desktop;
  SystemLanguage _systemLanguage = SystemLanguage.chinese;

  bool get darkMode => _darkMode;

  DeviceScreen get deviceScreen => _deviceScreen;

  SystemLanguage get systemLanguage => _systemLanguage;

  void toggleThemeMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  void setViewMode(DeviceScreen screen) {
    _deviceScreen = screen;
    notifyListeners();
  }

  void toggleLanguage(SystemLanguage language) {
    _systemLanguage = language;
    notifyListeners();
  }
}
