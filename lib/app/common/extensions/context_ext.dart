import 'package:flutter/material.dart';

extension ThemeX on BuildContext {
  //theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // media query
  MediaQueryData get md => MediaQuery.of(this);
  Size get mdSize => MediaQuery.sizeOf(this);
}
