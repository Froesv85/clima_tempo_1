import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clima_tempo/screens/home_screen.dart';
import 'package:clima_tempo/controllers/tema_controller.dart';
import 'package:clima_tempo/screens/theme_selection_screen.dart';

void main() {
   runApp(
      ChangeNotifierProvider(
         create: (context) => TemaController(),
         child: MyApp(),
      ),
   );
}

class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      final temaController = Provider.of<TemaController>(context);

      return MaterialApp(
         title: 'Manual do Terráqueo',
         theme: temaController.temaClaro,
         darkTheme: temaController.temaEscuro,
         themeMode: temaController.modoTema,
         debugShowCheckedModeBanner: false,
         home: HomeScreen2(),
      );
   }
}

class HomeScreen2 extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      final temaController = Provider.of<TemaController>(context);

      return Scaffold(
         appBar: AppBar(
            title: Text('Manual do Terráqueo'),
            actions: [
               IconButton(
                  icon: Icon(Icons.brightness_6),
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThemeSelectionScreen()),
                     );
                  },
               ),
               IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                     Navigator.of(context).pop();
                  },
               ),
            ],
         ),
         body: GestureDetector(
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
               );
            },
            child: Container(
               decoration: BoxDecoration(
                  gradient: LinearGradient(
                     colors: [
                        Color(0xFFED7B83),
                        Color(0xFFEC8A90),
                        Color(0xFFEBA2A4),
                        Color(0xFFE6D1CA),
                        Color(0xFFEEE9C7),
                     ],
                     begin: Alignment.topLeft,
                     end: Alignment.bottomRight,
                  ),
               ),
               child: Center(
                  child: CircleAvatar(
                     backgroundColor: Color(0xFFEEE9C7),
                     radius: 200,
                     backgroundImage: AssetImage('images/avatar.jpg'),
                  ),
               ),
            ),
         ),
      );
   }
}
