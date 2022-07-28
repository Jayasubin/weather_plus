import 'package:weather_plus/model/data_model/temperature.dart';

class WeatherData {
  String cityName;
  String date;
  String time;

  Temperature currentTemp;
  String currentStatus;
  String currentDesc;

  Temperature tomorrowMin;
  Temperature tomorrowMax;
  String tomorrowImage;

  Temperature dayAfterMin;
  Temperature dayAfterMax;
  String dayAfterImage;

  WeatherData({
    required this.cityName,
    required this.date,
    required this.time,
    required this.currentTemp,
    required this.currentStatus,
    required this.currentDesc,
    required this.tomorrowMin,
    required this.tomorrowMax,
    required this.tomorrowImage,
    required this.dayAfterMin,
    required this.dayAfterMax,
    required this.dayAfterImage,
  });
}
