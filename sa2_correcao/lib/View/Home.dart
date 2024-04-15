import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatefulWidget {
  String email;
  PaginaHome({required this.email});

  @override
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

class _PaginaHomeState extends State<PaginaHome> {
  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro
  bool _darkMode = false;
  String email; // Estado atual do tema escuro
  String _idioma = 'PT-BR';

  _PaginaHomeState({required this.email});
  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('${email}_darkMode') ??
          false; // Obtém o estado atual do tema escuro ou define como falso se não houver valor
      _idioma = _prefs.getString('${email}_idioma') ?? 'PT-BR';
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('${email}_darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _toggleIdioma(String novoIdioma) async {
    setState(() {
      _idioma = novoIdioma;
    });
    await _prefs.setString('${email}_idioma',
        _idioma); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Define o tema com base no modo escuro
      duration: Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('Armazenamento Interno'), // Título da barra de aplicativos
        ),
        body: Center(
          child: Column(
            children: [
              Switch(
                value:
                    _darkMode, // Valor do interruptor baseado no estado atual do tema escuro
                onChanged: (value) {
                  _toggleDarkMode(); // Chama a função para alternar o tema escuro
                },
              ),
              Text("Selecione o Idioma"),
              DropdownButton<String>(
                value: _idioma,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _idioma = value;
                    });
                    _toggleIdioma(value);
                  }
                },
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'pt-br',
                    child: Text('Português (Brasil)'),
                  ),
                  DropdownMenuItem(
                    value: 'en-us',
                    child: Text('Inglês (EUA)'),
                  ),
                  DropdownMenuItem(
                    value: 'es-ar',
                    child: Text('Espanhol (Argentina)'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
