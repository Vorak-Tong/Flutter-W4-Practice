import 'package:flutter/material.dart';

enum ThemeColor {
  blue(color: Color.fromARGB(255, 34, 118, 229)),
  green(color: Color.fromARGB(255, 229, 158, 221)),
  pink(color: Color.fromARGB(255, 156, 202, 8));

  const ThemeColor({required this.color});

  final Color color;
  Color get backgroundColor => color.withAlpha(100);
}

final ThemeColorService themeColorService = ThemeColorService();

class ThemeColorService extends ChangeNotifier{
  ThemeColor _currentThemeColor = ThemeColor.blue;

  ThemeColor get currentThemeColor => _currentThemeColor;

  void setTheme(ThemeColor value){
    _currentThemeColor = value;
    notifyListeners();
  }
}

ThemeColor get currentThemeColor => themeColorService.currentThemeColor;
