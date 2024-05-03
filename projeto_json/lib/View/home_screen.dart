import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mundo do cinema!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Lista de filmes!")),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {}, child: Text("Cadastro de filmes!")),
          ],
        ),
      ),
    );
  }
}
