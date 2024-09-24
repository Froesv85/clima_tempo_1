import 'package:flutter/material.dart';
import 'add_city_screen.dart';
import 'city_weather_screen.dart';

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
        title: Text('Manual do Terráqueo', style: TextStyle(fontFamily: 'Roboto-Regular')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFED7B83), Color(0xFFEC8A90), Color(0xFFEBA2A4), Color(0xFFE6D1CA), Color(0xFFEEE9C7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
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
                      weatherForecast[city] = [
                        'Domingo: 25°C',
                        'Segunda: 26°C',
                        'Terça: 27°C',
                        'Quarta: 28°C',
                        'Quinta: 29°C',
                        'Sexta: 30°C',
                        'Sábado: 31°C',
                      ];
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
            'Bem-vindo ao Manual do Terráqueo!',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              color: Color(0xFFED7B83),
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

