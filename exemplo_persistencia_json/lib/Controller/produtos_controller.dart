import 'dart:convert';
import 'dart:io';

import 'package:exemplo_persistencia_json/Model/Produtos.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ProdutoController {
  List<Produtos> _produtos = [];
  // Método get
  List<Produtos> get produtos => _produtos;

  // Métodos para decodificar e codificar o jSon
  // Método para carregar produtos do arquivo JSON
  Future<List<Produtos>> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    _produtos.clear();
    // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
    _produtos.addAll(jsonList.map((e) => Produtos.fromJson(e)));

    return _produtos;
  }

  // Método para salvar produtos no arquivo JSON
  Future<void> saveProdutos() async {
    // Obtém o diretório de documentos do aplicativo
    final appDocDir = await getApplicationDocumentsDirectory();
    // Caminho do arquivo produtos.json no diretório de documentos
    final filePath = '${appDocDir.path}/produtos.json';
    // Converte os produtos em uma lista de JSON
    final jsonList = _produtos.map((produto) => produto.toJson()).toList();
    // Escreve a lista de JSON no arquivo produtos.json
    await File(filePath).writeAsString(json.encode(jsonList));
  }

  // Método para adicionar um novo produto à lista
  void adicionarProduto(Produtos produto) {
    _produtos.add(produto);
  }
}