import 'package:flutter/material.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';
import 'package:flutter_weather_api/features/widgets/glass_container.dart';
import 'package:intl/intl.dart';

class TempHour extends StatelessWidget {
  const TempHour({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 200,
      top: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: weatherModel.forecast.forecastday.map((day) {
          return Row(
            children: [
              ...day.hour.map((hour) {
                final now = DateTime.now();
                final time = DateTime.parse(hour.time.toString());
                return (now.year == time.year &&
                        now.month == time.month &&
                        now.day == time.day)
                    ? Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 20),
                        child: Column(
                          children: [
                            Text(
                              DateFormat('HH:mm').format(hour.time).toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            Image.network('https:${hour.condition.icon}'),
                            Text('${hour.tempC.toStringAsFixed(0)}°C',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                      )
                    : const SizedBox();
              })
            ],
          );
        }).toList(),
      ),
    );
  }
}
