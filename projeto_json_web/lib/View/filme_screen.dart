import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_json_web/Controller/filme_controller.dart';
import 'package:projeto_json_web/View/filme_details_screen.dart';

class FilmeScreen extends StatefulWidget {
  const FilmeScreen({super.key});

  @override
  State<FilmeScreen> createState() => _FilmeScreenState();
}

class _FilmeScreenState extends State<FilmeScreen> {
  // atributos
  final FilmeController _controller = FilmeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Filmes"),
        leading: Icon(Icons.movie),
        backgroundColor: Color.fromARGB(255, 110, 15, 15),
        foregroundColor: Color.fromARGB(255, 226, 222, 222),
      ),
      body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListTile(
                title: Text("Adicionar um novo filme"),
                leading: Icon(Icons.add),
                onTap: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
              ),
              Expanded(
                child: FutureBuilder(
                    future: _controller.getFromFilmeFromService(),
                    builder: (context, snapshot) {
                      if (_controller.listFilmes.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: _controller.listFilmes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_controller.listFilmes[index].nome +
                                  " (${_controller.listFilmes[index].ano})"),
                              subtitle: Text(
                                  "${_controller.listFilmes[index].categoria} | ${_controller.listFilmes[index].duracao} min"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FilmeDetailsScreen(
                                                filme: _controller
                                                    .listFilmes[index])));
                              },
                              leading: Text('${(index + 1)}'),
                            );
                          },
                        );
                      }
                    }),
              ),
            ],
          )),
    );
  }
}
