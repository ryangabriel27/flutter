import 'package:flutter/material.dart';
import 'package:sa2/DatabaseHelper.dart';
import 'package:sa2/LoginPage.dart';
import 'package:sa2/Model/Cadastro.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final dbHelper = DatabaseHelper();

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _usuarioController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
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
                String email = _emailController.text;
                String senha = _senhaController.text;

                cadastraUsuario(usuario, senha,
                    email); // Chama função para cadastrar o usuario
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  void cadastraUsuario(String usuario, String senha, String email) {
    // Função que verifica se há erros e caso não cadastra o usuario no banco
    if (usuario.isNotEmpty && senha.isNotEmpty && email.isNotEmpty) {
      Cadastro novoCadastro = Cadastro(
          usuario: usuario.trim(), senha: senha.trim(), email: email.trim());

      dbHelper.create(novoCadastro).then((value) {
        // Se o cadastro for bem-sucedido, exibe um dialog de feedback
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Cadastro realizado'),
              content: Text('Usuário cadastrado com sucesso!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Fecha o dialog e retorna para a página de login
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      });
    }
  }
}
