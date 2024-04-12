import 'package:flutter/material.dart';
import 'package:sa2/CadastroPage.dart';
import 'package:sa2/DatabaseHelper.dart';
import 'package:sa2/HomePage.dart';

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

                login(usuario, senha); // Chama a função para fazer login
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
                        MaterialPageRoute(
                            builder: (context) => CadastroPage()));
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

  void login(String usuario, String senha) async {
    // Função que realiza o login
    if (usuario.isNotEmpty && senha.isNotEmpty) {
      // Verifica se os campos estão vazios
      var acesso = await dbHelper.login(
          usuario.trim(), senha.trim()); // Verifica o login do usuário
      if (acesso == true) {
        // Caso funcione
        dbHelper.salvaId(usuario.trim(), senha.trim()); // Armazena o id deste usuário
        dbHelper.getNome(usuario); 
        showDialog(
          // Avisa o usuário que o login foi feito corretamente
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
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage()), // Redireciona o usuario a pagina interna
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          // Avisa o usuário que o login não foi feito corretamente
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro no login'),
              content: Text('Usuário e/ou senha incorreta!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Fecha o dialog
                    Navigator.of(context).pop();
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
