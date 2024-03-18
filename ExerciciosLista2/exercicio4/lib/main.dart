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
          title: Text("Cadastro"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 61, 58, 58),
          foregroundColor: Colors.white,
        ),
        body: Center(
            child: Container(
          width: 500,
          height: 455,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Color.fromARGB(255, 243, 243, 243),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      prefixIcon: Icon(Icons.account_box_rounded)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_sharp)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirmar senha',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: ElevatedButton(
                  child: Text(
                    "Enviar",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green, // Cor do botão
                    fixedSize:
                        Size(120, 50), // Tamanho do botão (largura x altura)
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Erro!'),
                        content:
                            Text('Não é possível adicionar uma compra vazia.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Fecha o AlertDialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
