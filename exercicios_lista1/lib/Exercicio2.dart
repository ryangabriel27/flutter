import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio2());
}

class Exercicio2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 2"),
        ),
        body: Row(
          children: [
            Column(
              children: [Text("Animais"),],
            ),
            Column(
              children: [
                Text("Linha 1 Coluna 2 | "),
                Text("Linha 2 Coluna 2 | "),
                Text("Linha 3 Coluna 2 | "),
                Text("Linha 4 Coluna 2 | "),
              ],
            ),
            Column(children: [
              Text("Linha 1 Coluna 3 | "),
              Text("Linha 2 Coluna 3 | "),
              Text("Linha 3 Coluna 3 | "),
              Text("Linha 4 Coluna 3 | "),
            ]),
            Column(
              children: [
                Text("Linha 1 Coluna 4 | "),
                Text("Linha 2 Coluna 4 | "),
                Text("Linha 3 Coluna 4 | "),
                Text("Linha 4 Coluna 4 | "),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
