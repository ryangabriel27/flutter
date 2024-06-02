import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_json_web/Model/filme_model.dart';

class FilmeService {
  final String baseUrl = 'http://192.168.1.15:3000/filmes';

  Future<List<Filme>> getFilmes() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(
          'Response body: ${response.body}'); // Log para ver o corpo da resposta
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
}
