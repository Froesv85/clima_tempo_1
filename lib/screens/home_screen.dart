import 'package:flutter/material.dart';
import 'add_city_screen.dart';
import 'city_weather_screen.dart';
import 'package:clima_tempo/controllers/tema_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> cities = {};

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
                    MaterialPageRoute(builder: (context) => AddCityScreen(
                      onAddCity: (cityData) {
                        setState(() {
                          cities.addAll(cityData);
                        });
                      },
                      cities: cities,
                    )),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.cloud),
                title: Text('Previsão do Tempo', style: CustomTextStyle.listTileStyle),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CityWeatherScreen(
                      cities: cities.keys.toList(),
                      weatherForecast: cities.map((city, temp) => MapEntry(city, [temp])),
                    )),
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
