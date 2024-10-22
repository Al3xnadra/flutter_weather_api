import 'package:flutter/material.dart';
import 'package:flutter_weather_api/core/config.dart';
import 'package:flutter_weather_api/core/enums.dart';
import 'package:flutter_weather_api/core/injection_container.dart';
import 'package:flutter_weather_api/features/app/app.dart';

void main() {
  Config.appFlavor = Flavor.production;
  configureDependencies();
  runApp(const WeatherApp());
}
