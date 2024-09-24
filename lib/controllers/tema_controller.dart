import 'package:flutter/material.dart';

class TemaController extends ChangeNotifier {
  // Tema claro
  final ThemeData temaClaro = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  // Tema escuro
  final ThemeData temaEscuro = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  // Modo de tema atual
  ThemeMode _modoTema = ThemeMode.light;
  ThemeMode get modoTema => _modoTema;

  // Alternar entre temas claro e escuro
  void alternarTema() {
    if (_modoTema == ThemeMode.light) {
      _modoTema = ThemeMode.dark;
    } else {
      _modoTema = ThemeMode.light;
    }
    notifyListeners();
  }
}
class AppTheme {
  static const Color primaryColor = Color(0xFFED7B83);
  static const Color secondaryColor = Color(0xFFEEE9C7);

  static const TextStyle titleStyle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: secondaryColor,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    color: secondaryColor,
  );

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      textTheme: TextTheme(
        titleLarge: titleStyle,
        bodyLarge: bodyStyle,
      ),
    );
  }
}
class CustomTextStyle {
  static const TextStyle titleStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Color(0xFFEEE9C7),
    fontSize: 20,
  );

  static const TextStyle labelStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Color(0xFFEBA2A4),
  );

  static const TextStyle buttonStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Color(0xFFEC8A90),
  );

  static const TextStyle listTileStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Color(0xFFED7B83),
  );
}
