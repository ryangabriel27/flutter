import 'package:exemplo_persistencia_json/Model/Produtos.dart';
import 'package:flutter/material.dart';

class DetalhesProdutoPage extends StatelessWidget {
  DetalhesProdutoPage({required this.produto});
  Produtos produto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do produto - ${produto.nome}"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Nome do produto: ${produto.nome}"),
            Text("Preço do produto: ${produto.preco}"),
            Text("Categoria do produto: ${produto.categoria}")
          ],
        ),
      ),
    );
  }
}