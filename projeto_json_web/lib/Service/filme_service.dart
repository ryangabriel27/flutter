import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_json_web/Model/filme_model.dart';

class FilmeService {
  final String baseUrl = 'http://10.109.204.51:3000/filmes';

  Future<List<Filme>> getFilmes() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(response.body); -- Log para ver o corpo da resposta
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Filme.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load filmes');
    }
  }

  Future<Filme> postFilme(Filme filme) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      body: jsonEncode(filme.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return Filme.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create filme');
    }
  }

  Future<void> deleteFilme(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete filme');
    }
  }

  //putFilme
  Future<Filme> putFilme(Filme filme) async {
    final url = Uri.parse(baseUrl);
    final response = await http.put(
      url,
      body: jsonEncode(filme.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return Filme.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update filme');
    }
  }
}
