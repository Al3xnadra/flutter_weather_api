import 'package:dio/dio.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class WeatherRemoteRetrofitDataSource {
  @factoryMethod
  factory WeatherRemoteRetrofitDataSource(Dio dio) =
      _WeatherRemoteRetrofitDataSource;

  @GET(
      'forecast.json?key=3e1f0def825d4fa49d2221026232710&days=7&aqi=no&alerts=no')
  Future<WeatherModel> getWeatherData({
    @Query('q') String? city,
  });
}
