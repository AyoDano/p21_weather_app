import 'dart:convert';
import 'package:http/http.dart';

class WeatherService {
  static Future<Map<String, dynamic>> fetchWeather() async {
    const uriString =
        'https://api.open-meteo.com/v1/forecast?latitude=26.6931&longitude=128.0436&current=temperature_2m,relative_humidity_2m,precipitation,wind_speed_10m&forecast_days=1';
    final response = await get(Uri.parse(uriString));
    final weatherLocationData = await json.decode(response.body);

    final currentTime = weatherLocationData['current']['time'];
    final currentTemperature = weatherLocationData['current']['temperature_2m'];
    final currentHumidity =
        weatherLocationData['current']['relative_humidity_2m'];

    print(currentTime);
    print(currentTemperature);
    print(currentHumidity);

    // Option 1 (eine Variante wenn nur eine Liste ohne Kontext zurückgegeben werden soll)
    // return [currentTime, currentHumidity, currentTemperature];
    // ---------
    // Option 2 (Leserlichere Variante mit einer Map)
    return {
      "time": currentTime,
      "temperature": currentTemperature,
      "humidity": currentHumidity,
    };
  }
}
