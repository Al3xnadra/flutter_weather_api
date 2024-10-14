import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_api/core/enums.dart';
import 'package:flutter_weather_api/core/injection_container.dart';
import 'package:flutter_weather_api/domain/models/weather_model.dart';
import 'package:flutter_weather_api/features/home/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt()..getLastKnownWeatherModel(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage ??
                    'Something went wrong. Try again later')));
          }
        },
        builder: (context, state) {
          final weatherModel = state.model;

          return Scaffold(
            body: Center(child: Builder(
              builder: (context) {
                if (state.status == Status.loading) {
                  return const CircularProgressIndicator();
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (weatherModel != null)
                      DisplayWeather(weatherModel: weatherModel),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchCity(),
                  ],
                );
              },
            )),
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
          '${weatherModel.current.tempC.toString()} °C',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          weatherModel.location.name,
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
