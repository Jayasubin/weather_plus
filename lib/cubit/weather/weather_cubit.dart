import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_plus/model/data_model/weather_data.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
}
