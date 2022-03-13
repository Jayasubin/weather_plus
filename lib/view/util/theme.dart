import 'package:flutter/material.dart';

const Color defaultPrimary = Color(0xFFFF9800);
const Color defaultSecondary = Color(0xFF795548);

ThemeData defaultLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: defaultPrimary,
    secondary: defaultSecondary,
  ),
  textTheme: const TextTheme(),
);

ThemeData defaultDark = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.blueGrey,
  colorScheme: const ColorScheme.dark(
    primary: defaultSecondary,
    secondary: defaultPrimary,
  ),
  textTheme: const TextTheme(),
);

ThemeData customTheme(bool isLight, Color primary) {
  if (isLight) {
    return defaultLight.copyWith(
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: primary.withGreen(128).withRed(100),
      ),
    );
  } else {
    return defaultDark.copyWith(
      colorScheme: ColorScheme.dark(
        primary: primary,
        secondary: primary.withGreen(128).withRed(100),
      ),
    );
  }
}
