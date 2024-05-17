import 'package:flutter/material.dart';
import 'package:projeto_tempo_api/View/favorites_screen.dart';
import 'package:projeto_tempo_api/View/home_screen.dart';
import 'package:projeto_tempo_api/View/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Clima',
      theme: ThemeData.dark(),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/favorites': (context) => FavoriteScreen()
      },
    );
  }
}
