import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio5());
}

class Exercicio5 extends StatelessWidget {
  List<String> nomeFilmes = [
    // Array para o nome dos filmes
    "Titanic (1997)",
    "Harry Potter e a Pedra Filosofal (2001)",
    "O Rei Leão (1994)",
    "Matrix (1999)",
    "Oppenheimer (2023)",
    "Interestelar (2014)"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("FilmVerse"),
          centerTitle: true,
        ),
        body: LayoutBuilder(builder: (context, constraints) => {
          if(constraints.maxWidth < 768){
            return Column();
          } else {
            return Row();
          }
        }),
      ),
    );
  }
}
