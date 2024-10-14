import 'package:flutter_weather_api/data/remote_data_source/weather_remote_data_source.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteRetrofitDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({required String city}) {
    return _weatherRemoteDataSource.getWeatherData(city: city);
  }

  Future<WeatherModel?> getLastKnownWeatherModel() async {
    return WeatherModel(Location('Barcelona'), Current(25));
  }
}
