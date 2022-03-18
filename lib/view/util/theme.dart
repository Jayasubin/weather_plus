import 'package:flutter/material.dart';

class ThemePlus {
  static final ThemePlus _themePlus = ThemePlus._internal();

  factory ThemePlus() {
    return _themePlus;
  }

  ThemePlus._internal();

  static ThemeData generateTheme({
    required Brightness brightness,
    required Color primary,
    required Color background,
    required Color cardBackground,
    required Color highlight,
    required Color buttonBackground,
    required Color buttonText,
    required Color primaryText,
    required Color secondaryText,
  }) {
    return ThemeData(
      brightness: brightness,
      primaryColor: primary,
      backgroundColor: background,
      cardColor: cardBackground,
      highlightColor: highlight,
      textTheme: TextTheme(
        ///AppBar and other titles
        titleMedium: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: buttonText,
          letterSpacing: 1,
        ),

        ///Options
        labelMedium: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),

        ///For main Page
        labelLarge: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: primaryText,
        ),
        bodyLarge: TextStyle(
          fontSize: 55.0,
          fontWeight: FontWeight.w600,
          color: primaryText,
          shadows: [
            BoxShadow(color: secondaryText, spreadRadius: 5.0, blurRadius: 4.0),
          ],
        ),
        bodyMedium: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        bodySmall: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: secondaryText,
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 2,
        centerTitle: true,
        color: primary,
      ),
      iconTheme: IconThemeData(
        color: buttonText,
        size: 20,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(buttonBackground),
        trackColor: MaterialStateProperty.all<Color>(highlight),
      ),
      shadowColor: brightness == Brightness.light
          ? const Color(0xFF8D8D8D)
          : const Color(0xFF494949),
      dividerTheme: DividerThemeData(
        color: secondaryText,
        indent: 15.0,
        endIndent: 15.0,
        thickness: 1.0,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: buttonBackground,
        foregroundColor: buttonText,
      ),
    );
  }

  ThemeData makeTheme(Color primary, Brightness brightness) {
    bool isLight = brightness == Brightness.light;

    return generateTheme(
      brightness: brightness,
      primary: makePrimaryColor(primary),
      background: makeBackgroundColor(primary, brightness),
      cardBackground: makeCardColor(primary, brightness),
      highlight: makeHighlightColor(primary, brightness),
      buttonBackground: makeButtonColor(primary, brightness),
      buttonText: const Color(0xFFFFFFFF),
      primaryText: isLight ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
      secondaryText:
          isLight ? const Color(0xFF1D1D1D) : const Color(0xFFD0D0D0),
    );
  }

  Color makePrimaryColor(Color primary) {
    HSLColor hsl = HSLColor.fromColor(primary);
    return hsl.withSaturation(1.0).withLightness(0.18).toColor();
  }

  Color makeBackgroundColor(Color primary, Brightness brightness) {
    HSLColor hsl = HSLColor.fromColor(primary);
    return hsl
        .withSaturation(brightness == Brightness.light ? 0.41 : 0.13)
        .withLightness(brightness == Brightness.light ? 0.93 : 0.10)
        .toColor();
  }

  Color makeCardColor(Color primary, Brightness brightness) {
    HSLColor hsl = HSLColor.fromColor(primary);
    return hsl
        .withSaturation(brightness == Brightness.light ? 0.41 : 0.11)
        .withLightness(brightness == Brightness.light ? 0.79 : 0.23)
        .toColor();
  }

  Color makeHighlightColor(Color primary, Brightness brightness) {
    HSLColor hsl = HSLColor.fromColor(primary);
    return hsl
        .withSaturation(brightness == Brightness.light ? 0.42 : 0.21)
        .withLightness(brightness == Brightness.light ? 0.65 : 0.41)
        .toColor();
  }

  Color makeButtonColor(Color primary, Brightness brightness) {
    HSLColor hsl = HSLColor.fromColor(primary);
    return hsl
        .withSaturation(brightness == Brightness.light ? 1.0 : 1.0)
        .withLightness(brightness == Brightness.light ? 0.25 : 0.25)
        .toColor();
  }
}
