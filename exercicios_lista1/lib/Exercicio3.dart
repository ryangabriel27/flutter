import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio3());
}

class Exercicio3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 3"),
        ),
        body: ListView(
          children: [
            ListTile(   // 1° Item
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Um elefante cor-de-rosa voou sobre a lua",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile(  // 2° Item
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Pinguins gostam de surfar em icebergs",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile(   // 3° Item
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "O abacaxi dançou com a maçã no jardim",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile(   // 4° Item
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "O unicórnio fez amizade com o dragão",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile(   // 5° Item
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "As nuvens são feitas de algodão-doce",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile(  // 6° Item
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Os girassóis cantam quando o sol se põe",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile(  // 7 ° Item 
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Os peixes têm festas secretas no oceano",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile( // 8° Item
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Os pássaros inventaram um novo idioma",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile( // 9° Item
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "As estrelas são fadas brilhantes",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ListTile( // 10° Item 
              title: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "As montanhas contam histórias antigas",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
