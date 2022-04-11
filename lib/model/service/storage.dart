import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_plus/model/data_model/theme_model.dart';

class StorageService {
  static final StorageService _singleton = StorageService._internal();

  factory StorageService() {
    return _singleton;
  }

  StorageService._internal();

  Future<void> writeTheme({required ThemeModel theme}) async {
    final spInstance = await SharedPreferences.getInstance();

    spInstance.setBool('isLight', theme.brightness == Brightness.light);

    spInstance.setInt('pRed', theme.color.red);
    spInstance.setInt('pGreen', theme.color.green);
    spInstance.setInt('pBlue', theme.color.blue);
  }

  Future<ThemeModel> readTheme() async {
    final spInstance = await SharedPreferences.getInstance();

    bool isLight = spInstance.getBool('isLight') ?? true;

    int red = spInstance.getInt('pRed') ?? 0;
    int green = spInstance.getInt('pGreen') ?? 77;
    int blue = spInstance.getInt('pBlue') ?? 64;

    return ThemeModel(
      brightness: isLight ? Brightness.light : Brightness.dark,
      color: Color.fromRGBO(red, green, blue, 1.0),
    );
  }

  Future<void> writeUnit(bool isFahrenheit) async {
    final spInstance = await SharedPreferences.getInstance();

    spInstance.setBool('isFahrenheit', isFahrenheit);
  }

  Future<bool> readUnit() async {
    final spInstance = await SharedPreferences.getInstance();

    bool isFahrenheit = spInstance.getBool('isFahrenheit') ?? false;

    return isFahrenheit;
  }
}
