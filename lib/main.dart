import 'package:flutter/material.dart';
import 'package:weather_plus/view/main_page.dart';

void main() {
  runApp(const WeatherPlus());
}

class WeatherPlus extends StatelessWidget {
  const WeatherPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Plus',
      home: MainPage(),
    );
  }
}
