import 'package:flutter/material.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';
import 'package:flutter_weather_api/features/next_day/page/next_day_page.dart';
import 'package:flutter_weather_api/features/widgets/glass_container.dart';
import 'package:intl/intl.dart';

class NextDayInfo extends StatelessWidget {
  const NextDayInfo({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      top: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weatherModel.forecast.forecastday.map((day) {
          return Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NextDayPage(
                              day: day,
                            )));
              },
              child: Column(
                children: [
                  Text(
                    DateFormat('EEEE dd MMM').format(day.date),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '${day.day.maxtempC.toStringAsFixed(0)}°C / ${day.day.mintempC.toStringAsFixed(0)}°C',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    day.day.condition.text,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  Image.network('https:${day.day.condition.icon}'),
                ],
              ),
            ),
          );
        }).toList()
          ..removeAt(0),
      ),
    );
  }
}
