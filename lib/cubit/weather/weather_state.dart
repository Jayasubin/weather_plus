part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherFetching extends WeatherState {}

class WeatherError extends WeatherState {
  final String errorText;

  WeatherError(this.errorText);
}

class WeatherFetched extends WeatherState {
  final WeatherData weatherData;

  WeatherFetched(this.weatherData);
}
