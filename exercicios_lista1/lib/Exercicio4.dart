import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio4());
}

class Exercicio4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home_outlined),
          title: Icon(Icons.add_box),
          actions: [Icon(Icons.account_circle_rounded)],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 205, 205, 205),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text("Ola seja bem-vindo!!"),
        ),
      ),
    );
  }
}
