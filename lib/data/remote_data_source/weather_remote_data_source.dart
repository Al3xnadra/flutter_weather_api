import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherModel({required String city}) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'https://api.weatherapi.com/v1/forecast.json?key=3e1f0def825d4fa49d2221026232710&q=$city&days=7&aqi=no&alerts=no');

    return response.data;
  }
}
