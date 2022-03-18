class WeatherData {
  String cityName;
  String date;
  String time;
  double currentTemp;
  String currentStatus;
  String currentDesc;

  String tomorrowTempRange;
  String tomorrowImage;

  String dayAfterTempRange;
  String dayAfterImage;

  WeatherData({
    required this.cityName,
    required this.date,
    required this.time,
    required this.currentTemp,
    required this.currentStatus,
    required this.currentDesc,
    required this.tomorrowTempRange,
    required this.tomorrowImage,
    required this.dayAfterTempRange,
    required this.dayAfterImage,
  });
}
