import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final String cidade;

  WeatherScreen({required this.cidade});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String weather = 'sun'; // Estado inicial do clima

  void updateWeather(String newWeather) {
    setState(() {
      weather = newWeather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima em ${widget.cidade}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/${getWeatherImage(weather)}'),
            ),
            SizedBox(height: 20),
            Text(
              getWeatherDescription(weather),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.wb_sunny),
                  onPressed: () => updateWeather('sun'),
                ),
                IconButton(
                  icon: Icon(Icons.cloud),
                  onPressed: () => updateWeather('cloudy'),
                ),
                IconButton(
                  icon: Icon(Icons.beach_access),
                  onPressed: () => updateWeather('rain'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getWeatherImage(String weather) {
    switch (weather) {
      case 'sun':
        return '1.png';
      case 'cloudy':
        return '8.png';
      case 'rain':
        return '18.png';
      default:
        return '1.png';
    }
  }

  String getWeatherDescription(String weather) {
    switch (weather) {
      case 'sun':
        return 'Ensolarado';
      case 'cloudy':
        return 'Nublado';
      case 'rain':
        return 'Chuvoso';
      default:
        return 'Ensolarado';
    }
  }
}
