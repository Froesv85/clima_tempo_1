import 'package:flutter/material.dart';
import 'package:clima_tempo/models/city.dart';

class WeatherDetails extends StatelessWidget {
  final City city;

  WeatherDetails({required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo - ${city.name}'),
      ),
      body: ListView.builder(
        itemCount: city.weatherData.length,
        itemBuilder: (context, index) {
          final weather = city.weatherData[index];
          return ListTile(
            title: Text('${weather.hour} - ${weather.weather}'),
            subtitle: Text('Temperatura: ${weather.temperature}°C'),
          );
        },
      ),
    );
  }
}
