part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherFetching extends WeatherState {
  final String cityName;

  WeatherFetching(this.cityName);
}

class WeatherFetched extends WeatherState {
  final WeatherData weatherData;

  WeatherFetched(this.weatherData);
}
