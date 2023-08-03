import 'package:flutter/material.dart';

enum AppThemeMode {
  system(ThemeMode.system, Icons.settings, 'System'),
  light(ThemeMode.light, Icons.light_mode, 'Light'),
  dark(ThemeMode.dark, Icons.dark_mode, 'Dark');

  const AppThemeMode(this.value, this.iconData, this.text);

  final ThemeMode value;
  final IconData iconData;
  final String text;
}
