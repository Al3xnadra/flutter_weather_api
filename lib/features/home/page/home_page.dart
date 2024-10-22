import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_api/core/enums.dart';
import 'package:flutter_weather_api/core/injection_container.dart';
import 'package:flutter_weather_api/features/home/cubit/home_cubit.dart';
import 'package:flutter_weather_api/features/home/widgets/animated_search.dart';
import 'package:flutter_weather_api/features/home/widgets/display_weather.dart';

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
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sunny.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: const Color(0xFF063C69).withOpacity(0.2),
                child: Center(
                  child: Builder(
                    builder: (context) {
                      if (state.status == Status.loading) {
                        return const CircularProgressIndicator();
                      }

                      return Column(
                        children: [
                          if (weatherModel != null)
                            DisplayWeather(
                              weatherModel: weatherModel,
                            ),
                          if (state.status == Status.error)
                            const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 60),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: AnimatedSearch())),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
