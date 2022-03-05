import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_plus/model/data_model/weather_data.dart';
import 'package:weather_plus/util/secrets.dart';
import 'package:weather_plus/util/test_data.dart';
import 'package:weather_plus/view/util/date_formatter.dart';

class Weather {
  static final Weather _weather = Weather._internal();

  factory Weather() {
    return _weather;
  }

  Weather._internal();

  static const String _oneCall =
      "https://api.openweathermap.org/data/2.5/onecall";
  static const String _revGeoCode =
      "http://www.mapquestapi.com/geocoding/v1/reverse";
  static const String _iconUrl = "http://openweathermap.org/img/wn/";

  static const String _exclusions = "&exclude=minutely,hourly";
  static const String _units = "&units=metric";

  Future<WeatherData?> getWeatherByLocation(double lat, double lon) async {
    double? _preLat;
    WeatherData? _weatherData;
    DateTime? _updateTime;

    if (_preLat != lat &&
        (_updateTime == null ||
            _updateTime.difference(DateTime.now()).inMinutes >= 5)) {
      try {
        http.Response weatherRes = await http.get(Uri.parse(_oneCall +
            "?lat=$lat" +
            "&lon=$lon" +
            _exclusions +
            _units +
            "&appid=$owmApiKey"));

        http.Response geocodeRes = await http.get(Uri.parse(
            _revGeoCode + "?key=$mapQuestKey" + "&location=$lat,$lon"));

        var weatherResp = jsonDecode(weatherRes.body);
        var geocodeResp = jsonDecode(geocodeRes.body);

        final DateTime time =
            DateTime.fromMicrosecondsSinceEpoch(weatherResp['current']["dt"]);

        _weatherData = WeatherData(
          cityName: geocodeResp["results"][0]["locations"][0]["adminArea5"],
          date: toLocalDate(time),
          time: toLocalTime(time),
          currentTemp: weatherResp["current"]["temp"],
          currentStatus: _iconUrl +
              weatherResp["current"]["weather"][0]["icon"].toString() +
              '@2x.png',
          currentDesc: weatherResp["current"]["weather"][0]["main"],
          tomorrowTempRange:
              "${weatherResp["daily"][0]["temp"]["min"]}/${weatherResp["daily"][0]["temp"]["max"]}",
          tomorrowStatus: _iconUrl +
              weatherResp["daily"][0]["weather"][0]["icon"].toString() +
              '@2x.png',
          dayAfterTempRange:
              "${weatherResp["daily"][1]["temp"]["min"]}/${weatherResp["daily"][1]["temp"]["max"]}",
          dayAfterStatus: _iconUrl +
              weatherResp["daily"][1]["weather"][0]["icon"].toString() +
              '@2x.png',
        );

        _preLat = lat;
        _updateTime = DateTime.now();
      } catch (e) {
        rethrow;
        //return null;
      }

      return _weatherData;
    } else {
      return _weatherData!;
    }
  }

  WeatherData getWeatherByCity(String cityName) {
    return dummyWeather;
  }
}
