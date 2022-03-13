import 'dart:ui';

enum ThemeType {
  light,
  dark,
  customLight,
  customDark,
}

const Map<int, ThemeType> intToType = {
  0: ThemeType.light,
  1: ThemeType.dark,
  2: ThemeType.customLight,
  3: ThemeType.customDark,
};

const Map<ThemeType, int> typeToInt = {
  ThemeType.light: 0,
  ThemeType.dark: 1,
  ThemeType.customLight: 2,
  ThemeType.customDark: 3,
};

const List<Color> colorSelection = [
  Color(0xFFef5350),
  Color(0xFFec407a),
  Color(0xFF8e24aa),
  Color(0xFF3949ab),
  Color(0xFF1976d2),
  Color(0xFF039be5),
  Color(0xFF00796b),
  Color(0xFF388e3c),
  Color(0xFF558b2f),
  Color(0xFFffa000),
  Color(0xFFef6c00),
  Color(0xFF6d4c41),
  Color(0xFF616161),
];
