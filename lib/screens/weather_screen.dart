import 'package:flutter/material.dart';
import 'package:clima_tempo/weather_data.dart';
import 'package:clima_tempo/controllers/tema_controller.dart';

class WeatherScreen extends StatelessWidget {
  final String city;

  WeatherScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    final weatherForecast = WeatherData.getWeatherForecast();

    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão em  $city', style: CustomTextStyle.listTileStyle),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFED7B83), Color(0xFFEC8A90), Color(0xFFEBA2A4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: weatherForecast.map((forecast) {
              String image = WeatherData.getRandomWeatherImage();
              return Column(
                children: [
                  Image.asset(image, width: 100, height: 100),
                  Text(forecast, style: CustomTextStyle.titleStyle),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
