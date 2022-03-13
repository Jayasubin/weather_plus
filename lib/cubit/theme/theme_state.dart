part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeDefaultLight extends ThemeState {}

class ThemeDefaultDark extends ThemeState {}

class ThemeCustomLight extends ThemeState {
  final Color primaryColor;

  ThemeCustomLight(this.primaryColor);
}

class ThemeCustomDark extends ThemeState {
  final Color primaryColor;

  ThemeCustomDark(this.primaryColor);
}
