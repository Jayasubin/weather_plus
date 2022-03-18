import 'package:flutter/material.dart';
import 'package:weather_plus/util/constants.dart';
import 'package:weather_plus/view/widget/single_color.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Color Scheme',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.from(
            colorSelection.map(
              (color) => SingleColor(color: color),
            ),
          ),
        ),
      ],
    );
  }
}
