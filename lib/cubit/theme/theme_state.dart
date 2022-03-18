part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final ThemeData theme;

  const ThemeState({required this.theme});
}

class ThemeDefault extends ThemeState {
  const ThemeDefault({required ThemeData theme}) : super(theme: theme);
}

class ThemeChange extends ThemeState {
  const ThemeChange({required ThemeData theme}) : super(theme: theme);
}
