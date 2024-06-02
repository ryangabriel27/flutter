import 'package:flutter/material.dart';
import 'package:projeto_json_web/Model/filme_model.dart';

class FilmeDetailsScreen extends StatelessWidget {
  Filme filme;
  FilmeDetailsScreen({required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Filme - ${filme.nome}"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Nome do filme: ${filme.nome}"),
            Text("Ano do filme: ${filme.ano}"),
            Text("Categoria do filme: ${filme.categoria}")
          ],
        ),
      ),
    );
  }
}
