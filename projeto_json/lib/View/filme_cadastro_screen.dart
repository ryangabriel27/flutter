import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome do filme',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira o nome do filme';
                    } else {
                      return null;
                    }
                  },
                  controller: _nomeController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Categoria do filme',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira a categoria do filme';
                    } else {
                      return null;
                    }
                  },
                  controller: _nomeController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Sinopse',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a sinopse do filme';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Duração',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a duração do filme em minutos';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ano',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira o ano de lançamento do filme';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Classificação',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a classificação etária do filme';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Elenco',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira o elenco principal do filme';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _cadastrarFilme();
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Cadastrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _cadastrarFilme() {
    // Método para cadastrar filme no jSon!
    // Chamar classe controller
  }
}
