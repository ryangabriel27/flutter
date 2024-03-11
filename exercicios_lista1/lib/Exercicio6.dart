import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio6());
}

class Exercicio6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Responsividade Media Query - Exemplo"),
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        'lib/assets/1.jpg',
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.8,
                      )),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Paisagens cativantes oferecem uma visão magnífica da diversidade e beleza do nosso planeta. Cada cena natural, desde vastas planícies e majestosas montanhas até serenos lagos e exuberantes florestas, conta uma história única. A paleta de cores vibrantes em um pôr do sol reflete a harmonia entre o céu e a terra, enquanto formações geológicas distintas narram a história do tempo. As paisagens não apenas encantam os sentidos, mas também proporcionam uma profunda conexão com a natureza, inspirando uma apreciação duradoura pela maravilha e complexidade do mundo ao nosso redor.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Image.asset(
                      'lib/assets/2.jpg',
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  )
                ],
              ),
            )));
  }
}
