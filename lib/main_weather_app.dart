import 'package:flutter/material.dart';
import 'package:p21_weather_app/home_screen.dart';

class WeatherAppAPI extends StatelessWidget {
  const WeatherAppAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 121, 183),
        ),
      ),
      home: const MyHomePage(title: 'P21 - WeatherApp'),
    );
  }
}
