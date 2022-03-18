import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/weather/weather_cubit.dart';
import 'package:weather_plus/model/data_model/weather_data.dart';
import 'package:weather_plus/view/widget/forecast_card.dart';
import 'package:weather_plus/view/widget/gps_icon.dart';
import 'package:weather_plus/view/widget/internet_icon.dart';
import 'package:weather_plus/view/widget/main_drawer.dart';
import 'package:weather_plus/view/widget/page_padding.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.cityName,
                            style: textTheme.bodyMedium,
                          ),
                          Column(
                            children: [
                              Text(
                                data.date,
                                style: textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                data.time,
                                style: textTheme.bodySmall,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Divider(),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: theme.highlightColor,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: theme.shadowColor,
                              offset: Offset(3, 5),
                              blurRadius: 3.0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CachedNetworkImage(
                              imageUrl: data.currentStatus,
                              placeholder: (context, url) =>
                                  const Icon(Icons.rotate_left),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error_outline),
                            ),
                            Text(
                              '${data.currentTemp.toStringAsFixed(1)}\u00b0C ',
                              style: textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
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
              );
            } else if (state is WeatherError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Center(child: Icon(Icons.error_outline)),
                ],
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          //todo: bottom search bar
        },
      ),
    );
  }
}
