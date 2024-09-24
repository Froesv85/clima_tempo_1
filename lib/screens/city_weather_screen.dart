import 'package:flutter/material.dart';
import '../controllers/tema_controller.dart';
import 'home_screen.dart';
import 'weather_screen.dart';

class CityWeatherScreen extends StatefulWidget {
  final List<String> cities;
  final Map<String, List<String>> weatherForecast;

  CityWeatherScreen({required this.cities, required this.weatherForecast});

  @override
  _CityWeatherScreenState createState() => _CityWeatherScreenState();
}

class _CityWeatherScreenState extends State<CityWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo', style: CustomTextStyle.listTileStyle),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fundo_city.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cities.length,
                itemBuilder: (context, index) {
                  String city = widget.cities[index];
                  return ListTile(
                    title: Text(city, style: CustomTextStyle.listTileStyle),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Remover Cidade', style: CustomTextStyle.listTileStyle),
                              content: Text('Deseja remover $city da lista?', style: CustomTextStyle.listTileStyle),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancelar', style: CustomTextStyle.listTileStyle),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.cities.removeAt(index);
                                      widget.weatherForecast.remove(city);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Remover', style: CustomTextStyle.listTileStyle),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeatherScreen(city: city)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Icon(Icons.keyboard_return),
      ),
    );
  }
}

