import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/unit/unit_cubit.dart';

class UnitSwitch extends StatelessWidget {
  const UnitSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Fahrenheit Scale',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        BlocBuilder<UnitCubit, UnitState>(
          builder: (context, state) {
            return Switch(
              value: state.isFahrenheit,
              onChanged: (newBool) {
                context.read<UnitCubit>().changeUnit(newBool);
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
    );
  }
}
