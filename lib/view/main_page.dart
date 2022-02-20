import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/weather/weather_cubit.dart';
import 'package:weather_plus/view/widget/gps_icon.dart';
import 'package:weather_plus/view/widget/internet_icon.dart';
import 'package:weather_plus/view/widget/main_drawer.dart';
import 'package:weather_plus/view/widget/page_padding.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Plus'),
        actions: const [
          InternetIcon(),
          SizedBox(
            width: 8.0,
          ),
          GPSIcon(),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: PagePadding(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state is WeatherFetched
                            ? Text(
                                state.weatherData.cityName,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : const CircularProgressIndicator(),
                        Column(
                          children: [
                            state is WeatherFetched
                                ? const Text(
                                    '12/02/2022',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : const CircularProgressIndicator(),
                            const SizedBox(
                              height: 5.0,
                            ),
                            state is WeatherFetched
                                ? const Text(
                                    '04:55 pm',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : const CircularProgressIndicator(),
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    state is WeatherFetched
                        ? const Icon(
                            Icons.cloud,
                            size: 80,
                          )
                        : const CircularProgressIndicator(),
                    state is WeatherFetched
                        ? const Text(
                            '25.6\u00b0C ',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const CircularProgressIndicator(),
                  ],
                ),
                Column(
                  children: [
                    const Divider(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tomorrow',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: state is WeatherFetched
                                        ? const Icon(
                                            Icons.water,
                                            size: 30,
                                          )
                                        : const CircularProgressIndicator(),
                                  ),
                                  state is WeatherFetched
                                      ? const Text(
                                          '26.5/24.9',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : const CircularProgressIndicator(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'The day after',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: state is WeatherFetched
                                        ? const Icon(
                                            Icons.mode_night,
                                            size: 30,
                                          )
                                        : const CircularProgressIndicator(),
                                  ),
                                  state is WeatherFetched
                                      ? const Text(
                                          '28.5/25.9',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : const CircularProgressIndicator(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80.0,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          //todo:
        },
      ),
    );
  }
}
