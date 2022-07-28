import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/unit/unit_cubit.dart';
import 'package:weather_plus/model/data_model/temperature.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    Key? key,
    required this.day,
    required this.min,
    required this.max,
    required this.img,
  }) : super(key: key);

  final String day;
  final Temperature min;
  final Temperature max;
  final String img;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                day,
                style: textTheme.labelLarge,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CachedNetworkImage(
                      imageUrl: img,
                      height: 40.0,
                      width: 40.0,
                      placeholder: (context, url) =>
                          const Icon(Icons.rotate_left),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline),
                    ),
                  ),
                  BlocBuilder<UnitCubit, UnitState>(
                    builder: (context, state) {
                      return Text(
                        '${min.getStr(state.isFahrenheit)}/${max.getStr(state.isFahrenheit)}',
                        style: textTheme.labelLarge,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
