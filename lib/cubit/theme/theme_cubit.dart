import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_plus/model/data_model/theme_model.dart';
import 'package:weather_plus/model/service/storage.dart';
import 'package:weather_plus/util/constants.dart';
import 'package:weather_plus/view/util/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeDefaultLight());

  Future<void> getTheme() async {
    ThemeDataModel? theme = await StorageService().readTheme();

    applyTheme(theme);
  }

  void changeTheme(ThemeDataModel theme) {
    applyTheme(theme);

    StorageService().writeTheme(theme: theme);
  }

  void applyTheme(ThemeDataModel? theme) {
    if (theme == null) {
      emit(ThemeDefaultLight());
    } else {
      switch (theme.type) {
        case ThemeType.light:
          emit(ThemeDefaultLight());
          break;
        case ThemeType.dark:
          emit(ThemeDefaultDark());
          break;
        case ThemeType.customLight:
          emit(ThemeCustomLight(theme.color ?? defaultPrimary));
          break;
        case ThemeType.customDark:
          emit(ThemeCustomDark(theme.color ?? defaultSecondary));
          break;
      }
    }
  }
}
