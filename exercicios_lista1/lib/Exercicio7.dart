import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio7());
}

class Exercicio7 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Drawer"),
        drawer:),
      ),
    )
  }
}
