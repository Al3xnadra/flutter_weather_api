import 'package:flutter/material.dart';
import 'package:flutter_weather_api/core/injection_container.dart';
import 'package:flutter_weather_api/features/home/page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: GoogleFonts.hindSiliguri().fontFamily,
        ),
        home: const HomePage());
  }
}
