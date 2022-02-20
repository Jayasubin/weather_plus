import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/location/location_cubit.dart';
import 'package:weather_plus/cubit/weather/weather_cubit.dart';

class GPSIcon extends StatelessWidget {
  const GPSIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: BlocConsumer<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationInitial || state is LocationFetching) {
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          } else if (state is LocationFetched) {
            return const Icon(Icons.my_location);
          } else {
            return const Icon(Icons.error_outline);
          }
        },
        listener: (context, state) {
          if (state is LocationFetched) {
            BlocProvider.of<WeatherCubit>(context).getWeather(
              state.locationData.latitude!,
              state.locationData.longitude!,
            );
          }
        },
      ),
    );
  }
}
