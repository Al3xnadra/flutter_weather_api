import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_api/features/home/cubit/home_cubit.dart';

class AnimatedSearch extends StatefulWidget {
  const AnimatedSearch({super.key});

  @override
  State<AnimatedSearch> createState() => _AnimatedSearchState();
}

class _AnimatedSearchState extends State<AnimatedSearch> {
  bool open = true;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 56,
      width: open ? 56 : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                context.read<HomeCubit>().getWeatherModel(city: value);
              },
            ),
          )),
          Material(
            type: MaterialType.transparency,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  open = !open;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  open ? Icons.search : Icons.close,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
