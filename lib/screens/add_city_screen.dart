import 'package:flutter/material.dart';

import '../controllers/tema_controller.dart';

class AddCityScreen extends StatefulWidget {
  final Function(String) onAddCity;
  final List<String> cities;

  AddCityScreen({required this.onAddCity, required this.cities});

  @override
  _AddCityScreenState createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  final TextEditingController _controller = TextEditingController();

  void _addCity() {
    setState(() {
      if (!widget.cities.contains(_controller.text) && _controller.text.isNotEmpty) {
        widget.onAddCity(_controller.text);
        _controller.clear();
      }
    });
  }

  void _removeCity(int index) {
    setState(() {
      widget.cities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Cidade', style: CustomTextStyle.buttonStyle),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFED7B83),
              Color(0xFFEC8A90),
              Color(0xFFEBA2A4),
              Color(0xFFE6D1CA),
              Color(0xFFEEE9C7)
            ],
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
                decoration: InputDecoration(
                  labelText: 'Nome da Cidade',
                  labelStyle: CustomTextStyle.labelStyle,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addCity,
                child: Text('Adicionar', style: CustomTextStyle.buttonStyle),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.cities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.cities[index], style: AppTheme.titleStyle),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeCity(index),
                      ),
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
