import 'package:flutter/material.dart';
import 'package:sa2/CadastroPage.dart';
import 'package:sa2/DatabaseHelper.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final dbHelper = DatabaseHelper();

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 12.0),
            TextField(
              controller: _usuarioController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Coloque aqui a lógica para processar o cadastro
                String usuario = _usuarioController.text;
                String senha = _senhaController.text;

                login(usuario, senha);
              },
              child: Text('Entrar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Coloque aqui a lógica para processar o cadastro
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CadastroPage()));
              },
              child: Text('Cadastro'),
            ),
          ],
        ),
      ),
    );
  }

  void login(String usuario, String senha) {
    if (usuario.isNotEmpty && senha.isNotEmpty) {
      if (dbHelper.login(usuario, senha) == true) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sucesso ao logar'),
              content: Text('Login feito com sucesso!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Fecha o dialog e retorna para a página de login
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
