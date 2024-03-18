import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio3());
}

class Exercicio3 extends StatelessWidget {
  List<String> nomeJogadores = [
    "Lionel Messi",
    "Cristiano Ronaldo",
    "Robert Lewandowski",
    "Neymar Jr.",
    "Kevin De Bruyne",
    "Kylian Mbappé",
    "Erling Haaland",
  ];

  List<String> nomeTimesMundo = [
    "Real Madrid",
    "CFC Barcelona",
    "Bayern de Munique",
    "Manchester United",
    "Liverpool FC",
    "Juventus",
    "Paris Saint-Germain",
  ];

  List<String> nomeTimesBrasil = [
    "São Paulo FC",
    "Santos FC",
    "SE Palmeiras",
    "CR Vasco da Gama",
    "CR Flamengo",
    "Grêmio FBPA",
    "SC Internacional",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 3, // Número de abas
        child: Scaffold(
          appBar: AppBar(
            title: Text('Ranking Futebol'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Jogadores'),
                Tab(text: 'Times mundiais'),
                Tab(text: 'Times Brasil'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Conteúdo da Aba 1
              ListView.builder(
                itemCount: nomeJogadores.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/jogador$index.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# " +
                                      (index + 1).toString() +
                                      " " +
                                      nomeJogadores[index].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
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
// Conteúdo da Aba 2
              ListView.builder(
                itemCount: nomeTimesMundo.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/timesm$index.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# " +
                                      (index + 1).toString() +
                                      " " +
                                      nomeTimesMundo[index].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
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
// Conteúdo da Aba 3
              ListView.builder(
                itemCount: nomeTimesMundo.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/timesbr$index.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# " +
                                      (index + 1).toString() +
                                      " " +
                                      nomeTimesBrasil[index].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
