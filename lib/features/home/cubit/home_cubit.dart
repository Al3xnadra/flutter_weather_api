import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
}
