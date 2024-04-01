import 'package:exemplo_persistencia_interna/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Usando SharedPreferences",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences _prefs;
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('darkMode') ??
          false; // Obtém o estado atual do tema escuro ou define como falso se não houver valor
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Armazenamento Interno'), // Título da barra de aplicativos
      ),
      body: Center(
        child: Switch(
          value:
              _darkMode, // Valor do interruptor baseado no estado atual do tema escuro
          onChanged: (value) =>
              _toggleDarkMode(), // Método chamado quando o interruptor é alterado
        ),
      ),
    );
  }
}
