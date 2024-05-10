import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:projeto_json/Model/filmes.dart';

class FilmeController {
  List<Filme> _listFilmes = [];

  // GET
  List<Filme> get listFilmes => _listFilmes;

  // salvar Json
  Future<void> salvarJson() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    final file = File('$path/filmes.json');
    final jsonList = _listFilmes.map((filme) => filme.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }

  // carregar Json
  Future<List<Filme>> loadJson() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String path = appDocDir.path;
      final file = File('$path/filmes.json');
      final jsonList = jsonDecode(await file.readAsString());
      _listFilmes = jsonList.map((filme) => Filme.fromJson(filme)).toList();
    } catch (e) {
      _listFilmes = [];
    }

    return _listFilmes;
  }

  // adicionar filme
  Future<void> adicionarFilme(Filme filme) async {
    _listFilmes.add(filme);
    await salvarJson();
  }
}
