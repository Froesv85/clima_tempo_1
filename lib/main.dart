import 'package:flutter/material.dart';
import 'package:clima_tempo/screens/home_screen.dart';

void main() {
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         title: 'Manual do Terráqueo',
         theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto-Regular', // Adicione a fonte personalizada aqui
         ),
         debugShowCheckedModeBanner: false, // Remover o banner de debug
         home: HomeScreen2(),
      );
   }
}

class HomeScreen2 extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: Text('Manual do Terráqueo'),
            actions: [
               IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                     // Ação do botão de sair
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
