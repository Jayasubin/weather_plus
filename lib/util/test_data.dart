import 'package:flutter/material.dart';
import 'package:weather_plus/model/data_model/weather_data.dart';

WeatherData dummyWeather = WeatherData(
  cityName: 'Nowhere',
  date: '12/02/2022',
  time: '4:30 pm',
  currentTemp: 25.0,
  currentStatus: Icons.cloud,
  tomorrowStatus: Icons.water,
  dayAfterStatus: Icons.ac_unit,
  dayAfterTempRange: '23.2/26.6',
  tomorrowTempRange: '23.4/24.5',
  currentDesc: 'Foggy',
);
