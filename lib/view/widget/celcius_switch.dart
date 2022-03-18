import 'package:flutter/material.dart';

class CelsiusSwitch extends StatelessWidget {
  const CelsiusSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Celsius Scale',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Switch(
          value: false,
          onChanged: (newBool) {
            //todo:
          },
        ),
      ],
    );
  }
}
