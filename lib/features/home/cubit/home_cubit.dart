import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';
import 'package:flutter_weather_api/domain/repositories/weather_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._weatherRepository) : super(const HomeState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({required String city}) async {
    final weatherModel = await _weatherRepository.getWeatherModel(city: city);
    emit(HomeState(
      model: weatherModel,
    ));
  }

  Future<void> getLastKnownWeatherModel() async {
    final weatherModel = await _weatherRepository.getLastKnownWeatherModel();
    emit(HomeState(
      model: weatherModel,
    ));
  }
}
