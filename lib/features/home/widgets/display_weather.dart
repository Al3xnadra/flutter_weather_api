import 'package:flutter/material.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';
import 'package:flutter_weather_api/features/widgets/background_image.dart';
import 'package:flutter_weather_api/features/widgets/next_day_info.dart';
import 'package:flutter_weather_api/features/widgets/temp_hour.dart';
import 'package:flutter_weather_api/features/home/widgets/top_info.dart';
import 'package:flutter_weather_api/features/widgets/day_info.dart';

class DisplayWeather extends StatelessWidget {
  const DisplayWeather({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              BackgroundImage().imageName(weatherModel.current.condition.text),
            ),
            fit: BoxFit.cover),
      ),
      child: Container(
        color: const Color(0xFF063C69).withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              TopInfo(
                  location: weatherModel.location.name,
                  country: weatherModel.location.country,
                  tempC: weatherModel.current.tempC.toStringAsFixed(0),
                  feelslikeC:
                      weatherModel.current.feelslikeC.toStringAsFixed(0)),
              DayInfo(
                  humidity:
                      '${weatherModel.current.humidity.toStringAsFixed(0)}%',
                  wind:
                      '${weatherModel.current.windKph.toStringAsFixed(0)} Km/h',
                  precipMm:
                      '${weatherModel.current.precipMm.toStringAsFixed(0)}%'),
              TempHour(weatherModel: weatherModel),
              NextDayInfo(weatherModel: weatherModel),
            ],
          ),
        ),
      ),
    );
  }
}
