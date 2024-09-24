import 'package:flutter/material.dart';
import 'package:clima_tempo/weather_data.dart';
import 'package:clima_tempo/controllers/tema_controller.dart';

class WeatherScreen extends StatelessWidget {
  final String city;

  WeatherScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    final weatherForecast = WeatherData.getWeatherForecast();
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão em $city', style: CustomTextStyle.listTileStyle),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFED7B83), Color(0xFFEC8A90), Color(0xFFEBA2A4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: weatherForecast.length,
            itemBuilder: (context, index) {
              String forecast = weatherForecast[index];
              String image = WeatherData.getRandomWeatherImage();
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(image, width: 90, height: 90),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          forecast,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: isDarkTheme ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
