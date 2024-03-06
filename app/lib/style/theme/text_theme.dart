import 'package:calendar_app/style/colors/dark_colors.dart' as dark;
import 'package:calendar_app/style/colors/light_colors.dart' as light;
import 'package:flutter/material.dart';

// light text theme
TextStyle _lightTextStyle = const TextStyle(
  color: light.textColor,
  fontWeight: FontWeight.normal,
  fontFamily: "Inter",
);

TextTheme lightTextTheme = TextTheme(
  displayLarge: _lightTextStyle.copyWith(fontSize: 26),
  displayMedium: _lightTextStyle.copyWith(fontSize: 24),
  displaySmall: _lightTextStyle.copyWith(fontSize: 22),
  headlineMedium: _lightTextStyle.copyWith(fontSize: 20),
  headlineSmall: _lightTextStyle.copyWith(fontSize: 18),
  titleLarge: _lightTextStyle.copyWith(fontSize: 16),
  titleMedium: _lightTextStyle.copyWith(fontSize: 14),
  titleSmall: _lightTextStyle.copyWith(fontSize: 12),
  bodyLarge: _lightTextStyle.copyWith(fontSize: 10),
  bodyMedium: _lightTextStyle.copyWith(fontSize: 8),
);

// dark text theme
TextStyle _darkTextStyle = const TextStyle(
  color: dark.textColor,
  fontWeight: FontWeight.normal,
  fontFamily: "Inter",
);

TextTheme darkTextTheme = TextTheme(
  displayLarge: _darkTextStyle.copyWith(fontSize: 26),
  displayMedium: _darkTextStyle.copyWith(fontSize: 24),
  displaySmall: _darkTextStyle.copyWith(fontSize: 22),
  headlineMedium: _darkTextStyle.copyWith(fontSize: 20),
  headlineSmall: _darkTextStyle.copyWith(fontSize: 18),
  titleLarge: _darkTextStyle.copyWith(fontSize: 16),
  titleMedium: _darkTextStyle.copyWith(fontSize: 14),
  titleSmall: _darkTextStyle.copyWith(fontSize: 12),
  bodyLarge: _darkTextStyle.copyWith(fontSize: 10),
  bodyMedium: _darkTextStyle.copyWith(fontSize: 8),
);
