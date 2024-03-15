import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio1());
}

class Exercicio1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Youtube"),
        ),
        body: Container(
          padding: EdgeInsets.all(5.0),
          child: Row(children: [
            Column(  // Coluna para imagens
              children: [
                Image.asset('lib/assets/thumb.jpg')
              ],
            ),
            Column(  // Coluna para titulos e descrições
              children: [
                Container(
                  child: Text("TITULO"),
                ),
              ],
            )
          ],),
        ),
      ),
    );
  }
}
