import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_plus/model/data_model/weather_data.dart';
import 'package:weather_plus/util/test_data.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  void getWeatherByCity(String cityName) {
    emit(WeatherFetching());
    //todo:
  }

  void getWeather(double lat, double lon) {
    emit(WeatherFetching());
    Future.delayed(const Duration(milliseconds: 1000), () {
      emit(WeatherFetched(dummyWeather));
    });
  }
}
