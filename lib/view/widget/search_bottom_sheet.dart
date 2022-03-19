import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_plus/cubit/weather/weather_cubit.dart';
import 'package:weather_plus/view/widget/show_snack.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomSheet(
      onClosing: () {},
      enableDrag: false,
      backgroundColor: theme.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.primaryColor, width: 4.0),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            hintText: 'Enter area name',
          ),
          cursorColor: theme.primaryColor,
          style: theme.textTheme.labelLarge,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.search,
          onSubmitted: (String? input) {
            String? validationRes = validate(input);

            if (validationRes == null) {
              context.read<WeatherCubit>().getWeatherByCity(input!);

              Navigator.pop(context);
            } else {
              showCustomSnack(context, validationRes);
            }
          },
        ),
      ),
    );
  }
}

String? validate(String? input) {
  if (input == null || input.isEmpty) {
    return 'No input entered';
  } else if (input.length < 3) {
    return 'Input too short';
  } else {
    return null;
  }
}
