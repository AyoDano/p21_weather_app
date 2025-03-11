import 'package:flutter/material.dart';
import 'package:p21_weather_app/weather_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
              'Das aktuelle Wetter ist:',
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: FilledButton(
                onPressed: () {},
                child: Text('Wetter Aktualisieren'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> showCurrentWeather() async {
    final Map<String, dynamic> weatherDataMap =
        await WeatherService.fetchWeather();
    return ListTile(
      title: Text(
        '${weatherDataMap["temperature"]} °C',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: const Color.fromARGB(255, 54, 104, 127),
        ),
      ),
      subtitle: Text(
        "Humidity: ${weatherDataMap["humidity"]} %",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
