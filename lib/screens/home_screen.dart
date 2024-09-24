import 'package:flutter/material.dart';
import 'add_city_screen.dart';
import 'city_weather_screen.dart';
import 'weather_screen.dart';
import 'package:clima_tempo/weather_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> cities = [];
  Map<String, List<String>> weatherForecast = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual do Terráqueo',
            style: TextStyle(
                color: Color(0xFFED7B83),
                fontFamily: 'Roboto-Regular')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/fundo_menu.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Color(0xFFEEE9C7),
                      fontSize: 24,
                      fontFamily: 'Roboto-Bold',
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Cidades', style: TextStyle(fontFamily: 'Roboto-Bold')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCityScreen(onAddCity: (city) {
                    setState(() {
                      cities.add(city);
                      weatherForecast[city] = WeatherData.getWeatherForecast();
                    });
                  }, cities: cities)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text('Previsão do Tempo', style: TextStyle(fontFamily: 'Roboto-Bold')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CityWeatherScreen(cities: cities, weatherForecast: weatherForecast)),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Fundo_home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Bem-vindo Terráqueo!',
            style: TextStyle(
              fontFamily: 'Roboto-Bold',
              color: Color(0xFFED7B83),
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
