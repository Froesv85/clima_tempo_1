import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clima_tempo/controllers/tema_controller.dart';

class ThemeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final temaController = Provider.of<TemaController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Tema'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text('Tema Claro'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.light,
              groupValue: temaController.modoTema,
              onChanged: (ThemeMode? value) {
                temaController.alternarTema();
              },
            ),
          ),
          ListTile(
            title: Text('Tema Escuro'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: temaController.modoTema,
              onChanged: (ThemeMode? value) {
                temaController.alternarTema();
              },
            ),
          ),
        ],
      ),
    );
  }
}
