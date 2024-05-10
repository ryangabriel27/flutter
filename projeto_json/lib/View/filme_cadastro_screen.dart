import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_json/Control/filmes_controller.dart';
import 'package:projeto_json/Model/filmes.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final FilmeController _controller = FilmeController();
  List<Filme> _lista = [];

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _classificacaoController =
      TextEditingController();
  final TextEditingController _elencoController = TextEditingController();
  File? _imageSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                    controller: _categoriaController,
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
                    },
                    controller: _sinopseController,
                  ),
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
                    },
                    controller: _duracaoController,
                  ),
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
                    },
                    controller: _anoController,
                  ),
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
                    },
                    controller: _classificacaoController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Elenco - Separe por vírgula',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira o elenco principal do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _elencoController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _imageSelecionada != null
                      ? Image.file(
                          _imageSelecionada!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : SizedBox.shrink(),
                  ElevatedButton(
                      onPressed: _tirarFoto,
                      child: Text("Selecione a imagem do filme")),
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
      ),
    );
  }

  Filme getFilmes() {
    return Filme(
      nome: _nomeController.text,
      categoria: _categoriaController.text,
      sinopse: _sinopseController.text,
      duracao: int.parse(_duracaoController.text),
      ano: int.parse(_anoController.text),
      classificacao: int.parse(_classificacaoController.text),
      elenco: List.from(_elencoController.text.split(',')),
      imagens: _imageSelecionada!.path,
    );
  }

  void _cadastrarFilme() {
    // Método para cadastrar filme no jSon!
    // Chamar classe controller
    _controller.loadJson();

    _controller.adicionarFilme(getFilmes());
    // SnackBar cadastrado com sucesso!
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filme cadastrado com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _tirarFoto() async {
    // Método para tirar a imagem do filme
    final picker = new ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageSelecionada = File(pickedFile.path);
      });
    }
  }
}
