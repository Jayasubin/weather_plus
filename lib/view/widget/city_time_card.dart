import 'package:flutter/material.dart';

class CityTimeCard extends StatelessWidget {
  const CityTimeCard({
    Key? key,
    required this.city,
    required this.date,
    required this.time,
  }) : super(key: key);

  final String city;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          city,
          style: textTheme.bodyMedium,
        ),
        Column(
          children: [
            Text(
              date,
              style: textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              time,
              style: textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
