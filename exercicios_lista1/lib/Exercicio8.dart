import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio8());
}

class Exercicio8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cardLargura = MediaQuery.of(context).size.width * 0.4;
    double cardAltura = MediaQuery.of(context).size.height * 0.35;
    double cardImgAltura = cardAltura * 0.6;
    double cardImgLargura = cardLargura * 0.6;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Página de produtos!"),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Column(
              children: [
                Container(
                  // 1° Card
                  margin: EdgeInsets.all(10),
                  width: cardLargura,
                  height: cardAltura,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/produto1.png',
                          width: cardImgLargura,
                          height: cardImgAltura,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Repelente OFF",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Descrição do produto...",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  // 2° Card
                  margin: EdgeInsets.all(10),
                  width: cardLargura,
                  height: cardAltura,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/produto2.jpg',
                          width: cardImgLargura,
                          height: cardImgAltura,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Bolacha",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Descrição do produto...",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  // 3° Card
                  margin: EdgeInsets.all(10),
                  width: cardLargura,
                  height: cardAltura,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/produto3.png',
                          width: cardImgLargura,
                          height: cardImgAltura,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Leite",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Descrição do produto...",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  // 1° Card
                  margin: EdgeInsets.all(10),
                  width: cardLargura,
                  height: cardAltura,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/produto4.png',
                          width: cardImgLargura,
                          height: cardImgAltura,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Macarrão",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Descrição do produto...",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  // 2° Card
                  margin: EdgeInsets.all(10),
                  width: cardLargura,
                  height: cardAltura,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/produto2.jpg',
                          width: cardImgLargura,
                          height: cardImgAltura,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Repelente OFF",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Descrição do produto...",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  // 3° Card
                  margin: EdgeInsets.all(10),
                  width: cardLargura,
                  height: cardAltura,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/produto3.png',
                          width: cardImgLargura,
                          height: cardImgAltura,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Repelente OFF",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Descrição do produto...",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
