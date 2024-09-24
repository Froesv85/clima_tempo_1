import 'package:flutter/material.dart';

class AddCityScreen extends StatelessWidget {
  final Function(String) onAddCity;
  final List<String> cities;

  AddCityScreen({required this.onAddCity, required this.cities});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Cidade', style: TextStyle(fontFamily: 'Roboto')),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFED7B83), Color(0xFFEC8A90), Color(0xFFEBA2A4), Color(0xFFE6D1CA), Color(0xFFEEE9C7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Nome da Cidade', labelStyle: TextStyle(fontFamily: 'Roboto')),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  onAddCity(_controller.text);
                  Navigator.pop(context);
                },
                child: Text('Adicionar', style: TextStyle(fontFamily: 'Roboto')),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cities[index], style: TextStyle(fontFamily: 'Roboto')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
