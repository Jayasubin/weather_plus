import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_plus/model/data_model/temperature.dart';
import 'package:weather_plus/model/data_model/weather_data.dart';
import 'package:weather_plus/util/secrets.dart';

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

  static const String _geoCode =
      "http://www.mapquestapi.com/geocoding/v1/address";

  static const String _iconUrl = "http://openweathermap.org/img/wn/";

  static const String _exclusions = "&exclude=minutely,hourly";
  static const String _units = "&units=metric";

  WeatherData? _weatherData;

  Future<WeatherData?> getWeatherByLocation(double lat, double lon) async {
    double? _preLat;
    DateTime? _updateTime;

    if (_preLat != lat ||
        (_updateTime == null ||
            _updateTime.difference(DateTime.now()).inMinutes >= 5)) {
      try {
        http.Response weatherRes = await http.get(Uri.parse(_oneCall +
            "?lat=$lat" +
            "&lon=$lon" +
            _exclusions +
            _units +
            "&appid=$owmApiKey"));

        http.Response revGeocodeRes = await http.get(Uri.parse(
            _revGeoCode + "?key=$mapQuestKey" + "&location=$lat,$lon"));

        _weatherData = extractData(weatherRes, revGeocodeRes);
      } catch (e) {
        return null;
      }

      _preLat = lat;
      _updateTime = DateTime.now();

      return _weatherData;
    } else {
      return _weatherData!;
    }
  }

  Future<WeatherData?> getWeatherByCity(String cityName) async {
    String? preCity;
    DateTime? preTime;

    if (cityName != preCity ||
        (preTime != null &&
            preTime.difference(DateTime.now()).inMinutes >= 5)) {
      try {
        http.Response geoCodeRes = await http.get(
            Uri.parse(_geoCode + "?key=$mapQuestKey" + "&location=$cityName"));

        var decoded = jsonDecode(geoCodeRes.body);
        double _lat = decoded["results"][0]["locations"][0]["latLng"]["lat"];
        double _lon = decoded["results"][0]["locations"][0]["latLng"]["lng"];

        http.Response weatherRes = await http.get(Uri.parse(_oneCall +
            "?lat=$_lat" +
            "&lon=$_lon" +
            _exclusions +
            _units +
            "&appid=$owmApiKey"));

        _weatherData = extractData(weatherRes, geoCodeRes);

        preCity = cityName;
        preTime = DateTime.now();

        return _weatherData!;
      } catch (e) {
        //rethrow;
        return null;
      }
    }

    return _weatherData!;
  }

  WeatherData extractData(http.Response weatherRes, http.Response geocodeRes) {
    var weatherResp = jsonDecode(weatherRes.body);
    var revGeocodeResp = jsonDecode(geocodeRes.body);

    final DateTime raw = DateTime.fromMillisecondsSinceEpoch(
        weatherResp['current']["dt"] * 1000);

    final date = DateFormat('dd MMM, yyyy').format(raw);
    final time = DateFormat('hh:mm aaa').format(raw);

    return WeatherData(
      cityName: revGeocodeResp["results"][0]["locations"][0]["adminArea5"],
      date: date,
      time: time,
      currentTemp: Temperature(weatherResp["current"]["temp"]),
      currentStatus: _iconUrl +
          weatherResp["current"]["weather"][0]["icon"].toString() +
          '@2x.png',
      currentDesc: weatherResp["current"]["weather"][0]["main"],
      tomorrowMin: Temperature(weatherResp["daily"][0]["temp"]["min"]),
      tomorrowMax: Temperature(weatherResp["daily"][0]["temp"]["max"]),
      tomorrowImage: _iconUrl +
          weatherResp["daily"][0]["weather"][0]["icon"].toString() +
          '@2x.png',
      dayAfterMin: Temperature(weatherResp["daily"][1]["temp"]["min"]),
      dayAfterMax: Temperature(weatherResp["daily"][1]["temp"]["max"]),
      dayAfterImage: _iconUrl +
          weatherResp["daily"][1]["weather"][0]["icon"].toString() +
          '@2x.png',
    );
  }
}
