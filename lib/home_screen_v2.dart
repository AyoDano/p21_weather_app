import 'package:flutter/material.dart';
import 'package:p21_weather_app/weather_service.dart';

class MyWeatherPage extends StatefulWidget {
  const MyWeatherPage({super.key, required this.title});

  final String title;

  @override
  State<MyWeatherPage> createState() => _TestState();
}

class _TestState extends State<MyWeatherPage> {
  Widget weatherData = Text("Daten müssen aktualisiert werden!");
  Map<String, dynamic>? weatherDataMap;

  @override
  void initState() {
    //_loadData();
    super.initState();
  }

  void _loadData() async {
    weatherDataMap = await WeatherService.fetchWeather();
    setState(() {});
  }

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
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
              'Aktuelles Wetter in:',
            ),
            SizedBox(height: 10),
            // Wenn weatherData nicht null ist, gibt es mir die Daten aus
            weatherDataMap != null
                ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        "Rio De Janeiro",
                      ),
                    ),
                    ListTile(
                      title: Text(
                        '${weatherDataMap!["temperature"]} °C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: const Color.fromARGB(255, 54, 104, 127),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          "Humidity: ${weatherDataMap!["humidity"]} %",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                : Text("Bitte aktualisieren"),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: FilledButton(
                onPressed: () {
                  _loadData();
                },
                child: Text(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  'Wetter Aktualisieren',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
