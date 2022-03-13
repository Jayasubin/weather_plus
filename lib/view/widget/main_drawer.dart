import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/theme/theme_cubit.dart';
import 'package:weather_plus/model/data_model/theme_model.dart';
import 'package:weather_plus/util/constants.dart';
import 'package:weather_plus/view/widget/color_picker.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(child: Text('Weather Plus')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                const Text('Dark theme'),
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return Switch(
                      value:
                          state is ThemeCustomDark || state is ThemeDefaultDark,
                      onChanged: (newBool) {
                        context.read<ThemeCubit>().changeTheme(ThemeDataModel(
                            type: newBool ? ThemeType.dark : ThemeType.light));
                      },
                    );
                  },
                )
              ],
            ),
          ),
          const ColorPicker(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                const Text('Celsius Scale'),
                Switch(
                  value: false,
                  onChanged: (newBool) {
                    //todo:
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
