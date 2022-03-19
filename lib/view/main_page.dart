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
import 'package:weather_plus/view/widget/page_padding.dart';
import 'package:weather_plus/view/widget/search_bottom_sheet.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool visible = true;

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

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
            width: 16.0,
          ),
          GPSIcon(),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: PagePadding(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherFetched) {
              final WeatherData data = state.weatherData;

              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20.0),
                        CityTimeCard(
                          city: data.cityName,
                          date: data.date,
                          time: data.time,
                        ),
                        const SizedBox(height: 20.0),
                        const Divider(),
                        const SizedBox(height: 20.0),
                        CurrentWeatherCard(
                          currentStatus: data.currentStatus,
                          temperature: data.currentTemp.toStringAsFixed(1),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Column(
                      children: [
                        const Divider(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ForecastCard(
                          day: 'Tomorrow',
                          temp: data.tomorrowTempRange,
                          img: data.tomorrowImage,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ForecastCard(
                          day: 'The day after',
                          temp: data.dayAfterTempRange,
                          img: data.dayAfterImage,
                        ),
                        const SizedBox(
                          height: 80.0,
                        ),
                      ],
                    ),
                  ],
                ),
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
                    Text(state.errorText),
                  ],
                ),
              );
            } else if (state is WeatherFetching) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: Builder(builder: (context) {
        return Visibility(
          visible: true,
          child: FloatingActionButton(
            child: const Icon(Icons.search),
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (BuildContext context) => const SearchBottomSheet(),
              );
            },
          ),
        );
      }),
    );
  }
}
