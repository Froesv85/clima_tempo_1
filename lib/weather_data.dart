import 'dart:math';

class WeatherData {
  static final Random _random = Random();

  static List<String> getWeatherForecast() {
    List<String> forecasts = [
      'Segunda: ${_random.nextInt(15) + 15}°C',
      'Terça: ${_random.nextInt(15) + 15}°C',
      'Quarta: ${_random.nextInt(15) + 15}°C',
      'Quinta: ${_random.nextInt(15) + 15}°C',
      'Sexta: ${_random.nextInt(15) + 15}°C',

    ];
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
