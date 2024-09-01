class WeatherModel {
  double temp;
  int timezone;
  String name;
  String weather;
  int pressure;
  int humidity;
  var windSpeed;
  var feelsLike;

  WeatherModel({
    required this.temp,
    required this.timezone,
    required this.name,
    required this.weather,
    required this.pressure,
    required this.humidity,
    required this.feelsLike,
    this.windSpeed,
  });
}
