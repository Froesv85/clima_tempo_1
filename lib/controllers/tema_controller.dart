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
