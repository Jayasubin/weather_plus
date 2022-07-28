import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/weather/weather_cubit.dart';
import 'package:weather_plus/model/data_model/weather_data.dart';
import 'package:weather_plus/view/widget/city_time_card.dart';
import 'package:weather_plus/view/widget/current_weather_card.dart';
import 'package:weather_plus/view/widget/forecast_card.dart';
import 'package:weather_plus/view/widget/gps_icon.dart';
import 'package:weather_plus/view/widget/internet_icon.dart';
import 'package:weather_plus/view/widget/main_drawer.dart';
import 'package:weather_plus/view/widget/search_bottom_sheet.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    bool fabVisible = true;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Weather Plus',
          style: textTheme.titleMedium,
        ),
        actions: const [
          InternetIcon(),
          SizedBox(
            width: 14.0,
          ),
          GPSIcon(),
          SizedBox(
            width: 14.0,
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 10.0,
          top: 20,
          right: 10,
          bottom: 85.0,
        ),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherFetched) {
              final WeatherData data = state.weatherData;

              return Column(
                children: [
                  Column(
                    children: [
                      CityTimeCard(
                        city: data.cityName,
                        date: data.date,
                        time: data.time,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CurrentWeatherCard(
                        currentStatus: data.currentStatus,
                        temperature: data.currentTemp,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      ForecastCard(
                        day: 'Tomorrow',
                        min: data.tomorrowMin,
                        max: data.tomorrowMax,
                        img: data.tomorrowImage,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ForecastCard(
                        day: 'The day after',
                        min: data.dayAfterMin,
                        max: data.dayAfterMax,
                        img: data.dayAfterImage,
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is WeatherError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 40.0,
                      color: theme.primaryColor,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      state.errorText,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              );
            } else if (state is WeatherFetching) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(child: CircularProgressIndicator()),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: StatefulBuilder(
        builder: (BuildContext context, refresh) {
          void setVisible(bool current) => refresh(() => fabVisible = current);

          return Visibility(
            visible: fabVisible,
            child: FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () {
                setVisible(false);
                showBottomSheet(
                  context: context,
                  builder: (BuildContext context) => SearchBottomSheet(
                    setVisible: setVisible,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
