import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio7());
}

class Exercicio7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drawer"),
          backgroundColor: const Color.fromARGB(255, 13, 47, 74),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 13, 47, 74),
                  
                ),
                child: Text(
                  'Páginas',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              ListTile(
                title: const Text('Página inicial'),
              ),
              ListTile(
                title: const Text('Favoritos'),
              ),
              ListTile(
                title: const Text('Minha conta'),
              ),
              ListTile(
                title: const Text('Configurações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
