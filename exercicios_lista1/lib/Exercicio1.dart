
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 1"),
        ),
        body: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Text("Container 1"),
            ),
            Container(
              width: 150,
              height: 150,
              color: Color.fromARGB(255, 141, 2, 2),
              child: Text("Container 2"),
            ),
            Container(
              width: 200,
              height: 200,
              color: Color.fromARGB(255, 23, 124, 19),
              child: Text("Container 3"),
            ),
          ],
        ),
      ),
    );
  }
}
