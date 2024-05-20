import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> cadastros = [];
  final String githubToken = 'YOUR_GITHUB_TOKEN';
  final String repoName = 'ryangabriel27/projeto-json-flutter';

  @override
  void initState() {
    super.initState();
    fetchCadastros();
  }

  Future<void> fetchCadastros() async {
    final response = await http.get(Uri.parse('https://ryangabriel27.github.io/projeto-json-flutter/lista.json'));
    if (response.statusCode == 200) {
      setState(() {
        cadastros = json.decode(response.body)['cadastros'];
      });
    } else {
      throw Exception('Failed to load cadastros');
    }
  }

  Future<String> getFileSha() async {
    final url = 'https://api.github.com/repos/$repoName/contents/lista.json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['sha'];
    } else {
      throw Exception('Failed to get file SHA');
    }
  }

  Future<void> updateCadastros() async {
    final sha = await getFileSha();
    final url = 'https://api.github.com/repos/$repoName/contents/data.json';
    final updatedContent = base64Encode(utf8.encode(json.encode({'cadastros': cadastros})));
    final updatedFile = {
      'message': 'Updating data.json',
      'content': updatedContent,
      'sha': sha
    };

    final updateResponse = await http.put(
      Uri.parse(url),
      headers: {
        'Authorization': 'token $githubToken',
        'Content-Type': 'application/json'
      },
      body: json.encode(updatedFile)
    );

    if (updateResponse.statusCode != 200) {
      throw Exception('Failed to update cadastros');
    }
  }

  Future<void> addCadastro(String nome) async {
    final newId = cadastros.isNotEmpty ? cadastros.map((c) => c['id']).reduce((a, b) => a > b ? a : b) + 1 : 1;
    cadastros.add({'id': newId, 'nome': nome});
    await updateCadastros();
  }

  Future<void> removeCadastro(int id) async {
    cadastros.removeWhere((cadastro) => cadastro['id'] == id);
    await updateCadastros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter JSON List'),
      ),
      body: ListView.builder(
        itemCount: cadastros.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cadastros[index]['nome']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => removeCadastro(cadastros[index]['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addCadastro('Novo Cadastro'),
        child: Icon(Icons.add),
      ),
    );
  }
}
