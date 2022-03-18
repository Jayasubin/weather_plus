import 'package:flutter/material.dart';
import 'package:weather_plus/view/widget/celcius_switch.dart';
import 'package:weather_plus/view/widget/color_picker.dart';
import 'package:weather_plus/view/widget/dark_switch.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      backgroundColor: theme.backgroundColor,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.primaryColor),
            child: Center(
              child: Text(
                'Weather Plus',
                style: textTheme.titleMedium,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            child: Column(
              children: const [
                DarkSwitch(),
                SizedBox(height: 25.0),
                ColorPicker(),
                SizedBox(height: 25.0),
                CelsiusSwitch(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
