import 'package:flutter/material.dart';
import 'package:p21_weather_app/home_screen.dart';

class WeatherAppAPI extends StatelessWidget {
  const WeatherAppAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
