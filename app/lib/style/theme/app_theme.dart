import 'package:calendar_app/style/colors/light_colors.dart' as dark;
import 'package:calendar_app/style/colors/light_colors.dart' as light;
import 'package:calendar_app/style/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: light.swatchColor,
  primaryColor: light.primaryColor,
  colorScheme: const ColorScheme.light(
    primary: light.primaryColor,
    secondary: light.secondaryColor,
    background: light.backgroundColor,
  ),
  textTheme: lightTextTheme,
  scaffoldBackgroundColor: light.backgroundColor,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: dark.swatchColor,
  primaryColor: dark.primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: dark.primaryColor,
    secondary: dark.secondaryColor,
    background: dark.backgroundColor,
  ),
  textTheme: lightTextTheme,
  scaffoldBackgroundColor: dark.backgroundColor,
);
