part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.model,
    this.errorMessage,
    this.status,
  });

  final WeatherModel? model;
  final String? errorMessage;
  final Status? status;
}
