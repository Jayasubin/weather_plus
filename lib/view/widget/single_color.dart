import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/theme/theme_cubit.dart';
import 'package:weather_plus/model/data_model/theme_model.dart';
import 'package:weather_plus/util/constants.dart';

class SingleColor extends StatelessWidget {
  const SingleColor({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: color,
        border: Border.all(
          width: 2.0,
          color: Colors.blueGrey,
        ),
      ),
      child: InkWell(
        onTap: () {
          context.read<ThemeCubit>().changeTheme(
                ThemeDataModel(
                  type: isLight ? ThemeType.customLight : ThemeType.customDark,
                  color: color,
                ),
              );
        },
      ),
    );
  }
}
