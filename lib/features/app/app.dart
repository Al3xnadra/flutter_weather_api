import 'package:flutter/material.dart';
import 'package:flutter_weather_api/features/home/page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather Api',
        theme: ThemeData(
          fontFamily: GoogleFonts.hindSiliguri().fontFamily,
        ),
        home: const HomePage());
  }
}
