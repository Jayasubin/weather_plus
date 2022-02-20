import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/internet/internet_cubit.dart';
import 'package:weather_plus/cubit/location/location_cubit.dart';

class InternetIcon extends StatelessWidget {
  const InternetIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: BlocConsumer<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is InternetInitial) {
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          } else if (state is InternetUnavailable) {
            return const Icon(Icons.error_outline);
          } else if (state is InternetAvailable) {
            if (state.result == ConnectivityResult.mobile) {
              return const Icon(Icons.signal_cellular_4_bar);
            } else if (state.result == ConnectivityResult.wifi) {
              return const Icon(Icons.wifi);
            } else {
              return const Icon(Icons.mobile_friendly);
            }
          } else {
            return const Icon(Icons.warning);
          }
        },
        listener: (context, state) {
          if (state is InternetAvailable) {
            BlocProvider.of<LocationCubit>(context).getLocation();
          }
        },
      ),
    );
  }
}
