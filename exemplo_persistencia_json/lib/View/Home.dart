import 'package:exemplo_persistencia_json/Controller/produtos_controller.dart';
import 'package:exemplo_persistencia_json/Model/Produtos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdutoController _controller = ProdutoController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.loadProdutos();
  }

  void _adicionarProduto() {
    final nome = _nomeController.text;
    final preco = double.tryParse(_precoController.text) ?? 0.0;
    final categoria = _categoriaController.text;
    if (nome.isNotEmpty && preco > 0 && categoria.isNotEmpty) {
      setState(() {
        _controller.adicionarProduto(
            Produtos(nome: nome, preco: preco, categoria: categoria));
        _controller.saveProdutos();
      });
      _nomeController.clear();
      _precoController.clear();
      _categoriaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: FutureBuilder<List<Produtos>>(
                    future: _controller.loadProdutos(),
                    builder: (context, snapshot) {
                      if (_controller.produtos.isNotEmpty) {
                        return ListView.builder(
                          itemCount: _controller.produtos.length,
                          itemBuilder: (context, index) {
                            final produto = _controller.produtos[index];
                            return ListTile(
                              title: Text(produto.nome),
                              subtitle: Text(
                                  'Preço: ${produto.preco.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
            FloatingActionButton(onPressed: () {
              showAboutDialog(context: context, children: [
                Text('Nome:'),
                TextField(controller: _nomeController,),
                SizedBox(height: 10),
                Text('Preço:'),
                TextField(controller: _precoController,),
                SizedBox(height: 10),
                Text('Categoria:'),
                TextField(controller: _categoriaController,),
                SizedBox(height: 10),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: _adicionarProduto,
                    child: Text('Adicionar Produto'))
              ]);
            }, child: Text("Adicionar produto"),)
          ],
        ),
      ),
    );
  }
}