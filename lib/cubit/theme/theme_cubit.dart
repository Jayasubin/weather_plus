import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_plus/model/data_model/theme_model.dart';
import 'package:weather_plus/model/service/storage.dart';
import 'package:weather_plus/util/constants.dart';
import 'package:weather_plus/view/util/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeDefault(
            theme: ThemePlus().makeTheme(defaultColor, Brightness.light)));

  Future<void> getTheme() async {
    ThemeModel themeModel = await StorageService().readTheme();

    applyTheme(themeModel);
  }

  void changeTheme(ThemeModel themeModel) {
    applyTheme(themeModel);

    StorageService().writeTheme(theme: themeModel);
  }

  void applyTheme(ThemeModel themeModel) {
    emit(
      ThemeChange(
        theme: ThemePlus().makeTheme(themeModel.color, themeModel.brightness),
      ),
    );
  }
}
