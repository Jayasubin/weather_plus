import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_plus/model/data_model/weather_data.dart';
import 'package:weather_plus/model/service/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  void getWeatherByCity(String cityName) {
    emit(WeatherFetching());
    //todo:
    //emit (WeatherFetched());
  }

  Future<void> getWeatherByLocation(double lat, double lon) async {
    emit(WeatherFetching());

    final WeatherData? data = await Weather().getWeatherByLocation(lat, lon);
    if (data != null) {
      emit(WeatherFetched(data));
    } else {
      emit(WeatherError());
    }
  }
}
