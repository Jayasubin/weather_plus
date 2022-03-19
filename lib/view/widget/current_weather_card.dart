import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({
    Key? key,
    required this.currentStatus,
    required this.temperature,
  }) : super(key: key);

  final String currentStatus;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: theme.highlightColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            offset: const Offset(3, 5),
            blurRadius: 2.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl: currentStatus,
            placeholder: (context, url) => const Icon(Icons.rotate_left),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          ),
          Text(
            '$temperature\u00b0C ',
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
