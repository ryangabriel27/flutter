import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio5());
}

class Exercicio5 extends StatelessWidget {
  List<String> nomeFilmes = [
    // Array para o nome dos filmes
    "Titanic (1997)",
    "Harry Potter e a Pedra Filosofal (2001)",
    "O Rei Leão (1994)",
    "Matrix (1999)",
    "Oppenheimer (2023)",
    "Interestelar (2014)"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("FilmVerse"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: nomeFilmes.length,
          itemBuilder: (context, index) {
            if (MediaQuery.of(context).size.width * 1 > 450) 
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/filme$index.jpg',
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.6,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nomeFilmes[index].toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                foregroundColor: Colors.white,
                              ),
                              child: Text('Ver trailer'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );

          
          },
        ),
      ),
    );
  }
}