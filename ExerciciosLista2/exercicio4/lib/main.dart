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
          title: Text("Formulario para contato"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 61, 58, 58),
          foregroundColor: Colors.white,
        ),
        body: Center(
            child: Container(
          width: 500,
          height: 450,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 47, 47, 47),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mensagem',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green, // Cor do botão
                    fixedSize:
                        Size(120, 50), // Tamanho do botão (largura x altura)
                  ),
                  onPressed: () {},
                  child: Text(
                    'Enviar',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18), // Cor do texto
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
