import 'package:flutter/material.dart';
import '../controllers/tema_controller.dart';

class AddCityScreen extends StatefulWidget {
  final Function(Map<String, String>) onAddCity;
  final Map<String, String> cities;

  AddCityScreen({required this.onAddCity, required this.cities});

  @override
  _AddCityScreenState createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _tempController = TextEditingController();

  void _addCity() {
    setState(() {
      if (!widget.cities.containsKey(_cityController.text) && _cityController.text.isNotEmpty && _tempController.text.isNotEmpty) {
        String temperature = '${_tempController.text}°C';
        widget.onAddCity({_cityController.text: temperature});
        _cityController.clear();
        _tempController.clear();
      }
    });
  }

  void _removeCity(String city) {
    setState(() {
      widget.cities.remove(city);
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
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Nome da Cidade',
                  labelStyle: CustomTextStyle.labelStyle,
                ),
              ),
              TextField(
                controller: _tempController,
                decoration: InputDecoration(
                  labelText: 'Temperatura atual',
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
                    String city = widget.cities.keys.elementAt(index);
                    return ListTile(
                      title: Text('$city: ${widget.cities[city]}', style: AppTheme.titleStyle),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeCity(city),
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

