import 'dart:math';

class WeatherData {
  final String hour;
  final double temperature;
  final String weather;

  WeatherData({required this.hour, required this.temperature, required this.weather});
}

List<WeatherData> generateWeatherData() {
  final random = Random();
  final weatherConditions = ['Ensolarado', 'Nublado', 'Chuvoso', 'Tempestuoso', 'Neve'];
  List<WeatherData> data = [];

  for (int i = 0; i < 24; i++) {
    String hour = '${i.toString().padLeft(2, '0')}:00';
    double temperature = -10 + random.nextDouble() * 50; // Temperatura entre -10 e 40 graus Celsius
    String weather = weatherConditions[random.nextInt(weatherConditions.length)];
    data.add(WeatherData(hour: hour, temperature: temperature, weather: weather));
  }

  return data;
}

class Weather {
  final String hour;
  final int temperature;
  final String weather;

  Weather({required this.hour, required this.temperature, required this.weather});
}

class City {
  final String name;
  final List<Weather> weatherData;

  City({required this.name, required this.weatherData, required String temperature});
}

// Exemplo de dados
final City exampleCity = City(
  name: 'Exemplo',
  weatherData: [
    Weather(hour: '10:00', temperature: 25, weather: 'Ensolarado'),
    Weather(hour: '11:00', temperature: 27, weather: 'Parcialmente Nublado'),
  ], temperature: '',
);
