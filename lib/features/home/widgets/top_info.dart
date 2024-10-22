import 'package:flutter/material.dart';
import 'package:flutter_weather_api/core/custom_icons.dart';
import 'package:flutter_weather_api/features/home/widgets/animated_search.dart';

class TopInfo extends StatelessWidget {
  const TopInfo(
      {super.key,
      required this.location,
      required this.country,
      required this.tempC,
      required this.feelslikeC});

  final String location, country, tempC, feelslikeC;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Row(
              children: [
                const Icon(
                  CustomIcons.location,
                  size: 41,
                  color: Colors.white,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      country,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            const Align(
              alignment: Alignment.topRight,
              child: AnimatedSearch(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Text(
            '$tempC°C',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 90,
              height: 1,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text(
            'Reel feel $feelslikeC°C',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
