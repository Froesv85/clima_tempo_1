import 'package:flutter/material.dart';
import 'package:clima_tempo/models/city.dart';

class CityCard extends StatelessWidget {
  final City city;
  final VoidCallback onRemove;

  CityCard({required this.city, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      child: ListTile(
        title: Text(
          city.name,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Theme.of(context).primaryColor),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
