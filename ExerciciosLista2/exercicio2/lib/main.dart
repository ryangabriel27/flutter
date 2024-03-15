import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

void main() {
  runApp(Exercicio2());
}

class Exercicio2 extends StatelessWidget {
  List<String> nomeFilmes = [
    "Titanic (1997)",
    "Harry Potter e a Pedra Filosofal (2001)",
    "O Rei Leão (1994)",
    "Matrix (1999)"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 2"),
        ),
        body: ListView.builder(
          itemCount: nomeFilmes.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/filme$index.jpg',
                      width: 100,
                      height: 100,
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
                              onPressed: () => openBrowserTab(index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.purple, // Cor de fundo roxa
                                foregroundColor:
                                    Colors.white, // Cor do texto branco
                              ),
                              child: Text(
                                'Ver trailer',
                              )),
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

void openBrowserTab(int index) {
  switch (index) {
    case 0:
      FlutterWebBrowser.openWebPage(
          url: "https://www.youtube.com/watch?v=IH6_CA_ocqY");
      break;
    case 1:
      FlutterWebBrowser.openWebPage(
          url: "https://www.youtube.com/watch?v=9fIObnIGMlI");
      break;
    case 2:
      FlutterWebBrowser.openWebPage(
          url: "https://www.youtube.com/watch?v=rHiHRhbTv-Q");
      break;
    case 3:
      FlutterWebBrowser.openWebPage(
          url: "https://www.youtube.com/watch?v=2KnZac176Hs");
      break;
    default:
      break;
  }
}
