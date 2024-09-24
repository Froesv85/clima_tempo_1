import '../weather_data.dart'; // Verifique se o caminho está correto

class City {
  final String name;

  City({required this.name, required List weatherData, required String temperature, required List weather});

  @override
  String toString() {
    return name;
  }

  factory City.fromString(String name) {
    return City(name: name, weatherData: [], temperature: '', weather: []);
  }

  get weatherData => null;

  String? get temperature => null;
}
