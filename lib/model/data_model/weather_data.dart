import 'package:flutter/material.dart';

class WeatherData {
  String cityName;
  DateTime dateAndTime;
  double currentTemp;
  IconData todayStatus;
  double tomorrowTemp;
  IconData tomorrowStatus;

  WeatherData({
    required this.cityName,
    required this.dateAndTime,
    required this.currentTemp,
    required this.todayStatus,
    required this.tomorrowTemp,
    required this.tomorrowStatus,
  });
}
