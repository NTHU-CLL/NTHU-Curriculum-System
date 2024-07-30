import 'config.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _darkMode = false;
  double _widthFactor = 1.0;
  DeviceScreen _deviceScreen = DeviceScreen.desktop;
  SystemLanguage _systemLanguage = SystemLanguage.chinese;

  bool get darkMode => _darkMode;

  double get widthFactor => _widthFactor;

  DeviceScreen get deviceScreen => _deviceScreen;

  SystemLanguage get systemLanguage => _systemLanguage;

  void toggleThemeMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  void setWidthFactor(double widthFactor) {
    _widthFactor = widthFactor;
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
