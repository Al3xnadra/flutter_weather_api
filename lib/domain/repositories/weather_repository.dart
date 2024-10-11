import 'package:dio/dio.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({required String city}) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'https://api.weatherapi.com/v1/forecast.json?key=3e1f0def825d4fa49d2221026232710&q=$city&days=7&aqi=no&alerts=no');
    final responseData = response.data;
    if (responseData == null) {
      return null;
    }
    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;

    return WeatherModel(temperature: temperature, city: name);
  }

  Future<WeatherModel?> getLastKnownWeatherModel() async {
    return const WeatherModel(temperature: 25, city: 'Barcelona');
  }
}
