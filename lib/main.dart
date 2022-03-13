import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/internet/internet_cubit.dart';
import 'package:weather_plus/cubit/location/location_cubit.dart';
import 'package:weather_plus/cubit/theme/theme_cubit.dart';
import 'package:weather_plus/cubit/weather/weather_cubit.dart';
import 'package:weather_plus/view/main_page.dart';
import 'package:weather_plus/view/util/theme.dart';

void main() {
  runApp(const WeatherPlus());
}

class WeatherPlus extends StatelessWidget {
  const WeatherPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..getTheme()),
        BlocProvider(create: (_) => InternetCubit()..checkConnectivity()),
        BlocProvider(create: (_) => LocationCubit()),
        BlocProvider(create: (_) => WeatherCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          //Future.delayed(const Duration(milliseconds: 2500),);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather Plus',
            theme: state is ThemeDefaultDark
                ? defaultDark
                : state is ThemeCustomLight
                    ? customTheme(true, state.primaryColor)
                    : state is ThemeCustomDark
                        ? customTheme(false, state.primaryColor)
                        : defaultLight,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}
