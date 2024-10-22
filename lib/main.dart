import 'package:flutter/material.dart';
import 'package:flutter_weather_api/core/injection_container.dart';
import 'package:flutter_weather_api/features/app/app.dart';

void main() {
  configureDependencies();
  runApp(const WeatherApp());
}
