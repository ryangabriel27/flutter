import 'package:flutter/material.dart';
import 'package:sa3/Controller/dbController.dart';
import 'package:sa3/Model/usuario.dart';
import 'package:sa3/View/Cadastro.dart';
import 'package:sa3/View/Home.dart';

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
        title: Text("LOGIN"),
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
                // Login
                String usuario = _usuarioController
                    .text; // Pega oq estava escrito na caixa de texto
                String senha = _senhaController
                    .text; // Pega oq estava escrito na caixa de texto

                _login(usuario, senha); // Chama a função para fazer login
              },
              child: Text('Entrar'),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Não tem uma conta? "),
                TextButton(
                  onPressed: () {
                    // Coloque aqui a lógica para processar o cadastro
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CadastroPage()));
                  },
                  child: Text('Cadastre-se'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _login(String usuario, String senha) async {
    if (usuario.isNotEmpty && senha.isNotEmpty) {
      String usuario = _usuarioController.text;
      String senha = _senhaController.text;

      DatabaseHelper dbControl = DatabaseHelper();
      try {
        var acesso = await dbHelper.login(usuario, senha);
        if (acesso) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(usuario: usuario.trim()),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Usuario ou senha incorretos'),
          ));
        }
      } catch (e) {
        print('Erro durante o login: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro durante o login. Tente novamente mais tarde.'),
        ));
      }
    }
  }
}
