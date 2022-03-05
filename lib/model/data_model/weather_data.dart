class WeatherData {
  String cityName;
  String date;
  String time;
  double currentTemp;
  String currentStatus;
  String currentDesc;

  String tomorrowTempRange;
  String tomorrowStatus;

  String dayAfterTempRange;
  String dayAfterStatus;

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
