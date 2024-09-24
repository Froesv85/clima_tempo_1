import 'dart:math';
import 'package:intl/intl.dart';

class WeatherData {
  static final Random _random = Random();

  static List<String> getWeatherForecast() {
    List<String> forecasts = [];
    DateTime today = DateTime.now();
    List<String> daysOfWeek = ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'];

    for (int i = 0; i < 8; i++) {
      DateTime forecastDate = today.add(Duration(days: i));
      String dayName = daysOfWeek[forecastDate.weekday % 7];
      String formattedDate = DateFormat('dd/MM/yyyy').format(forecastDate);
      String forecast = '$dayName, $formattedDate: ${_random.nextInt(15) + 15}°C';
      forecasts.add(forecast);
    }

    return forecasts;
  }

  static String getRandomWeatherImage() {
    List<String> images = [
      'images/sol.png',
      'images/nevoeiro.png',
      'images/chuva.png',
      'images/sol_nuvens.png',
      'images/nublado.png',
      'images/trovoada.png',
      'images/sol_chuva.png',
    ];
    return images[_random.nextInt(images.length)];
  }
}

