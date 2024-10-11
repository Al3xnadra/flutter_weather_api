import 'package:flutter_weather_api/domain/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({required String city}) async {
    return const WeatherModel(temperature: 10, city: 'Warsaw');
  }

  Future<WeatherModel?> getLastKnownWeatherModel() async {
    return const WeatherModel(temperature: 25, city: 'Barcelona');
  }
}
