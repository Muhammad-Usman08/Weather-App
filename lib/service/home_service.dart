import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

// Get API Data
Future<List<WeatherModel>> getData(String cityName) async {
  try {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=f5783e1fee68d6228723ecc46804ee40&units=metric');
    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);

    WeatherModel weatherData = WeatherModel(
      feelsLike: jsonResponse['main']['feels_like'],
      humidity: jsonResponse['main']['humidity'],
      name: jsonResponse['name'],
      pressure: jsonResponse['main']['pressure'],
      timezone: jsonResponse['timezone'],
      weather: jsonResponse['weather'][0]['main'],
      temp: jsonResponse['main']['temp'],
      windSpeed: jsonResponse['wind']['speed'],
    );

    return [weatherData];
  } catch (e) {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Karachi&appid=f5783e1fee68d6228723ecc46804ee40&units=metric');
    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);

    WeatherModel weatherData = WeatherModel(
      feelsLike: jsonResponse['main']['feels_like'],
      humidity: jsonResponse['main']['humidity'],
      name: jsonResponse['name'],
      pressure: jsonResponse['main']['pressure'],
      timezone: jsonResponse['timezone'],
      weather: jsonResponse['weather'][0]['main'],
      temp: jsonResponse['main']['temp'],
      windSpeed: jsonResponse['wind']['speed'],
    );
    return [weatherData];
  }
}
