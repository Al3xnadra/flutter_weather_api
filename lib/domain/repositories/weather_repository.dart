import 'package:flutter_weather_api/data/remote_data_source/weather_remote_data_source.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({required String city}) async {
    final responseData =
        await _weatherRemoteDataSource.getWeatherModel(city: city);

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
