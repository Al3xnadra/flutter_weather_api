import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel(
    Location location,
    Current current,
    Forecast forecast,
  ) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Location with _$Location {
  factory Location(
    String name,
    String country,
    DateTime localtime,
  ) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Current with _$Current {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Current(
    double tempC,
    Condition condition,
    double windKph,
    double precipMm,
    double humidity,
    double feelslikeC,
  ) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
class Condition with _$Condition {
  factory Condition(
    String text,
    String icon,
  ) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}

@freezed
class Forecast with _$Forecast {
  factory Forecast(
    List<Forecastday> forecastday,
  ) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@freezed
class Forecastday with _$Forecastday {
  factory Forecastday(
    DateTime date,
    List<Hour> hour,
    Day day,
  ) = _Forecastday;

  factory Forecastday.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayFromJson(json);
}

@freezed
class Hour with _$Hour {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Hour(
    DateTime time,
    double tempC,
    Condition condition,
  ) = _Hour;

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);
}

@freezed
class Day with _$Day {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Day(
    double maxtempC,
    double mintempC,
    double maxwindKph,
    double totalprecipMm,
    double avghumidity,
    Condition condition,
  ) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
