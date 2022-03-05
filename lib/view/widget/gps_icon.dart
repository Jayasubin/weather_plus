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
          if (state is LocationFetched) {
            return IconButton(
              icon: const Icon(Icons.my_location),
              onPressed: () {
                context.read<LocationCubit>().getLocation();
              },
            );
          } else if (state is LocationError) {
            return const Icon(Icons.error_outline);
          } else if (state is LocationInitial || state is LocationFetching) {
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {
          if (state is LocationFetched) {
            context.read<WeatherCubit>().getWeatherByLocation(
                  state.locationData.latitude!,
                  state.locationData.longitude!,
                );
          }
        },
      ),
    );
  }
}
