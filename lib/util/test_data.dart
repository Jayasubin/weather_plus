import 'package:flutter/material.dart';
import 'package:weather_plus/model/data_model/weather_data.dart';

WeatherData dummyWeather = WeatherData(
  cityName: 'Nowhere',
  dateAndTime: DateTime.now(),
  currentTemp: 25.0,
  todayStatus: Icons.cloud,
  tomorrowTemp: 28.0,
  tomorrowStatus: Icons.water,
);
