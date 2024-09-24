import 'package:flutter/material.dart';

class CityWeatherScreen extends StatelessWidget {
  final List<String> cities;
  final Map<String, List<String>> weatherForecast;

  CityWeatherScreen({required this.cities, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo', style: TextStyle(fontFamily: 'Roboto')),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFED7B83), Color(0xFFEC8A90), Color(0xFFEBA2A4), Color(0xFFE6D1CA), Color(0xFFEEE9C7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            String city = cities[index];
            return ListTile(
              title: Text(city, style: TextStyle(fontFamily: 'Roboto')),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Remover Cidade', style: TextStyle(fontFamily: 'Roboto')),
                        content: Text('Deseja remover $city da lista?', style: TextStyle(fontFamily: 'Roboto')),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancelar', style: TextStyle(fontFamily: 'Roboto')),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              cities.removeAt(index);
                              weatherForecast.remove(city);
                              (context as Element).markNeedsBuild();
                            },
                            child: Text('Remover', style: TextStyle(fontFamily: 'Roboto')),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Previsão do Tempo para $city', style: TextStyle(fontFamily: 'Roboto')),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: weatherForecast[city]!.map((forecast) => Text(forecast, style: TextStyle(fontFamily: 'Roboto'))).toList(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar', style: TextStyle(fontFamily: 'Roboto')),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
