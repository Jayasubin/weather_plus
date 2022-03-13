import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_plus/model/data_model/theme_model.dart';
import 'package:weather_plus/util/constants.dart';

class StorageService {
  static final StorageService _singleton = StorageService._internal();

  factory StorageService() {
    return _singleton;
  }

  StorageService._internal();

  Future<void> writeTheme({required ThemeDataModel theme}) async {
    final spInstance = await SharedPreferences.getInstance();

    spInstance.setInt('type', typeToInt[theme.type]!);

    if (theme.type == ThemeType.customDark ||
        theme.type == ThemeType.customLight) {
      spInstance.setInt('pRed', theme.color?.red ?? 0);
      spInstance.setInt('pGreen', theme.color?.green ?? 0);
      spInstance.setInt('pBlue', theme.color?.blue ?? 0);
    }
  }

  Future<ThemeDataModel?> readTheme() async {
    final spInstance = await SharedPreferences.getInstance();

    if (spInstance.containsKey('type')) {
      ThemeType type = intToType[spInstance.getInt('type')]!;

      if (type == ThemeType.customLight || type == ThemeType.customDark) {
        int red = spInstance.getInt('pRed') ?? 0;
        int green = spInstance.getInt('pGreen') ?? 0;
        int blue = spInstance.getInt('pBlue') ?? 0;

        return ThemeDataModel(
            type: type, color: Color.fromRGBO(red, green, blue, 1.0));
      } else {
        return ThemeDataModel(type: type);
      }
    }
    return null;
  }
}
