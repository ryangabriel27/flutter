import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio1());
}

class Exercicio1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layout Calculadora"),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
          width: 250,
          height: 275,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 181, 181, 181),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.green,
                width: 200,
                height: 100,
              ),
              SizedBox(height: 20), // Espaçamento entre o TextField e os botões
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("1"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("2"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("3"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("4"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("5"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("6"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("7"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("8"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("9"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.add_call),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("0"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.cancel),
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
