import 'package:flutter/material.dart';
import 'package:projeto_json_web/View/cadastro_screen.dart';
import 'package:projeto_json_web/View/filme_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto jSon Web",
      home: FilmeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => FilmeScreen(),
        '/cadastro': (context) => CadastroScreen()
      },
    );
  }
}
