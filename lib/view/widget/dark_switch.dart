import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/theme/theme_cubit.dart';
import 'package:weather_plus/model/data_model/theme_model.dart';

class DarkSwitch extends StatelessWidget {
  const DarkSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Dark theme',
          style: theme.textTheme.labelMedium,
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Switch(
              value: state.theme.brightness == Brightness.dark,
              onChanged: (newBool) {
                context.read<ThemeCubit>().changeTheme(
                      ThemeModel(
                        brightness:
                            newBool ? Brightness.dark : Brightness.light,
                        color: theme.primaryColor,
                      ),
                    );
              },
            );
          },
        ),
      ],
    );
  }
}
