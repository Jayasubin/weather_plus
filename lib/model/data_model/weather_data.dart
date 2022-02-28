import 'package:flutter/material.dart';

class WeatherData {
  String cityName;
  String date;
  String time;
  double currentTemp;
  IconData currentStatus;
  String currentDesc;

  String tomorrowTempRange;
  IconData tomorrowStatus;

  String dayAfterTempRange;
  IconData dayAfterStatus;

  WeatherData({
    required this.cityName,
    required this.date,
    required this.time,
    required this.currentTemp,
    required this.currentStatus,
    required this.currentDesc,
    required this.tomorrowTempRange,
    required this.tomorrowStatus,
    required this.dayAfterTempRange,
    required this.dayAfterStatus,
  });
}
