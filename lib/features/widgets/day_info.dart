import 'package:flutter/material.dart';
import 'package:flutter_weather_api/core/custom_icons.dart';
import 'package:flutter_weather_api/features/widgets/glass_container.dart';

class DayInfo extends StatelessWidget {
  const DayInfo({
    super.key,
    required this.humidity,
    required this.wind,
    required this.precipMm,
  });

  final String humidity, wind, precipMm;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      top: 150,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            column(
              humidity,
              'Humidity',
              CustomIcons.waterDrop,
            ),
            const VerticalDivider(
              thickness: 1,
              color: Colors.white,
            ),
            column(
              wind,
              'Wind Speed',
              CustomIcons.windy,
            ),
            const VerticalDivider(
              thickness: 1,
              color: Colors.white,
            ),
            column(
              precipMm,
              'Precipitation',
              CustomIcons.drizzle,
            ),
          ],
        ),
      ),
    );
  }

  Widget column(String text, String secText, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Text(
          secText,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
