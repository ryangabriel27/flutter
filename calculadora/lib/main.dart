import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  int numeroEscolhido = Random().nextInt(101);
  String _resultado = '';
  String _tentativas = '';
  int nTentativas = 0;

  void _verificar() {
    double nPalpite = double.tryParse(_controllerNumero1.text) ?? 0.0;
    String resultado = '';

    setState(() {
      //Montar as operações
      if (nPalpite == numeroEscolhido) {
        resultado = "Parabéns! Você acertou";
      } else if (nPalpite > numeroEscolhido) {
        resultado = "O número é menor";
        nTentativas++;
      } else {
        resultado = "O número é maior";
        nTentativas++;
      }

      _resultado = resultado;
      _tentativas = 'Tentativa: $nTentativas';
    });
  }

  void _reiniciar() {
    int novoNumero = Random().nextInt(101);
    setState(() {
      if (novoNumero != numeroEscolhido) {
        numeroEscolhido = novoNumero;
      } else {
        novoNumero = Random().nextInt(101);
      }

      _tentativas = '';
      _resultado = '';
      nTentativas = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinhe o número'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite um número para o palpite'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _verificar(),
              child: Text('Verificar'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _reiniciar(),
              child: Text('Reiniciar'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Text(_tentativas,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
