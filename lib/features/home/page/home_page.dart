import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_api/data/remote_data_source/weather_remote_data_source.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';
import 'package:flutter_weather_api/domain/repositories/weather_repository.dart';
import 'package:flutter_weather_api/features/home/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(WeatherRepository(WeatherRemoteDataSource()))
            ..getLastKnownWeatherModel(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final weatherModel = state.model;
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (weatherModel != null)
                    DisplayWeather(weatherModel: weatherModel),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchCity(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DisplayWeather extends StatelessWidget {
  const DisplayWeather({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weatherModel.temperature.toString()} °C',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          weatherModel.city,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class SearchCity extends StatelessWidget {
  SearchCity({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text('City'),
                hintText: 'London',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<HomeCubit>().getWeatherModel(city: _controller.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
