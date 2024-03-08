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
              children: [
                Text("Nome "),
                Text("Cristiano Ronaldo "),
                Text("Messi "),
                Text("Kylian Mbappe "),
                Text("Zlatan Ibrahimovic "),
              ],
            ),
            Column(
              children: [
                Text("Idade  "),
                Text("36  "),
                Text("34  "),
                Text("23  "),
                Text("40  "),
              ],
            ),
            Column(
              children: [
                Text("Nacionalidade "),
                Text("Portuguesa "),
                Text("Argentina "),
                Text("Francesa "),
                Text("Sueca "),
              ],
            ),
            Column(
              children: [
                Text("Time "),
                Text("Al-Nassr "),
                Text("Inter Miami "),
                Text("Paris Saint-Germain "),
                Text("AC Milan "),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
