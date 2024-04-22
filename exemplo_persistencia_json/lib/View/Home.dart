import 'dart:convert';
import 'dart:io';

import 'package:exemplo_persistencia_json/Model/Produtos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Produtos> _produtos = [];
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void initState() {
    super.initState();
    _loadProdutos();
  }

  Future<void> _loadProdutos() async {
    final data = await rootBundle.loadString('assets/produtos.json');
    final jsonList = json.decode(data) as List<dynamic>;
    setState(() {
      _produtos = jsonList
          .map((e) => Produtos(
              nome: e['nome'], preco: e['preco'], categoria: e['categoria']))
          .toList();
    });
  }

  Future<void> saveProdutos() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDocDir.path}/produtos.json';
    final jsonList = _produtos.map((produto) => produto.toJson()).toList();
    await File(filePath).writeAsString(json.encode(jsonList));
  }
}
