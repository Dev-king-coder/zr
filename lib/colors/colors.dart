import 'package:flutter/material.dart';

// Color theme = const Color(0xff4263EC);
Color accent = const Color(0xffF4F7FF);
Color grey = const Color(0xfff0f0f0);

class CustomTheme {
  static const MaterialColor theme = MaterialColor(primary, <int, Color>{
    50: Color(0xFFE8ECFD),
    100: Color(0xFFC6D0F9),
    200: Color(0xFFA1B1F6),
    300: Color(0xFF7B92F2),
    400: Color(0xFF5E7AEF),
    500: Color(primary),
    600: Color(0xFF3C5BEA),
    700: Color(0xFF3351E7),
    800: Color(0xFF2B47E4),
    900: Color(0xFF1D35DF),
  });
  static const int primary = 0xFF4263EC;

  static const MaterialColor themeAccent = MaterialColor(accent, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(accent),
    400: Color(0xFFAEB7FF),
    700: Color(0xFF95A0FF),
  });
  static const int accent = 0xFFF4F7FF;
}
