import 'package:flutter/material.dart';
import 'package:sa2/CadastroPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cadastro",
      home: CadastroPage(),
    );
  }
}
