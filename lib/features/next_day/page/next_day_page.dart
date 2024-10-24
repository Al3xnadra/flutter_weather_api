import 'package:flutter/material.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';
import 'package:flutter_weather_api/features/next_day/widgets/next_day_top_info.dart';
import 'package:flutter_weather_api/features/widgets/background_image.dart';
import 'package:flutter_weather_api/features/widgets/glass_container.dart';
import 'package:flutter_weather_api/features/widgets/day_info.dart';
import 'package:intl/intl.dart';

class NextDayPage extends StatelessWidget {
  const NextDayPage({
    super.key,
    required this.day,
  });

  final Forecastday day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              BackgroundImage().imageName(day.day.condition.text),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: const Color(0xFF063C69).withOpacity(0.2),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                children: [
                  DayTopInfo(
                      date: day.date,
                      maxtempC: day.day.maxtempC.toStringAsFixed(0),
                      mintempC: day.day.mintempC.toStringAsFixed(0)),
                  DayInfo(
                      humidity: '${day.day.avghumidity.toStringAsFixed(0)}%',
                      wind: '${day.day.maxtempC.toStringAsFixed(0)} Km/h',
                      precipMm: '${day.day.totalprecipMm.toStringAsFixed(0)}%'),
                  GlassContainer(
                    height: 200,
                    top: 20,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: day.hour.map((day) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                DateFormat('HH:mm').format(day.time).toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image.network('https:${day.condition.icon}'),
                              Text('${day.tempC.toStringAsFixed(0)}°C',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
