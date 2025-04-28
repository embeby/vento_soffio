import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String lan ='e';

  void changeAppTheme(ThemeMode newTheme) {
  if(currentTheme==newTheme)return;
    currentTheme = newTheme;
    notifyListeners();
  }
  void changeLan(String newLan)
  {
    if(lan ==newLan) return;
    lan=newLan;
    notifyListeners();
  }
}
