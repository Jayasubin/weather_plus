import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/theme/theme_cubit.dart';
import 'package:weather_plus/model/data_model/theme_model.dart';

class SingleColor extends StatelessWidget {
  const SingleColor({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
        border: Border.all(
          width: 1.5,
          color: Colors.grey,
        ),
      ),
      child: InkWell(
        onTap: () {
          context.read<ThemeCubit>().changeTheme(
                ThemeModel(
                  brightness: theme.brightness,
                  color: color,
                ),
              );
        },
      ),
    );
  }
}
