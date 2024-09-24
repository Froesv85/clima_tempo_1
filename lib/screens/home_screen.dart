import 'package:flutter/material.dart';
import 'add_city_screen.dart';
import 'city_weather_screen.dart';
import 'package:clima_tempo/weather_data.dart';
import 'package:clima_tempo/controllers/tema_controller.dart';

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
        title: Text('Manual do Terráqueo', style: CustomTextStyle.listTileStyle),
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
                    style: CustomTextStyle.titleStyle.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Cidades', style: CustomTextStyle.listTileStyle),
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
              title: Text('Previsão do Tempo', style: CustomTextStyle.listTileStyle),
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
            style: CustomTextStyle.titleStyle.copyWith(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
