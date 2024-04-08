import 'package:flutter/material.dart';
import 'package:sa2/DatabaseHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences _prefs; // SharedPreferences
  int userID = -1; // Define um id que não existe
  final dbHelper = DatabaseHelper(); //
  bool _darkMode = false; // Tema claro definido como padrão
  double _fontSize = 16.0; // Tamanho padrão da fonte
  List<double> fontSizes = [
    12.0,
    14.0,
    16.0,
    18.0,
    20.0,
    24.0
  ]; // Opções de tamanho de fonte
  late double selectedFontSize =
      _fontSize; // Seleciona o tamanho padrão como padrão

  @override
  void initState() {
    super.initState();
    identificaId(); // Carrega as preferências de acordo com o id do usuário
  }

  void identificaId() async {
    // Função que carrega as preferências
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      userID = _prefs.getInt('userID') ??
          -1; // Pega o int do sharedpreferences para saber qual o id do usuário logado
      _darkMode = _prefs.getBool('darkMode_$userID') ??
          false; // Verifica se o modo escuro foi ativo
      _fontSize = _prefs.getDouble('fontSize_$userID') ??
          _fontSize; // Verifica qual o tamanho de fonte que o usuário configurou
      selectedFontSize =
          _fontSize; // Coloca o tamanho das fontes de acordo com as preferências
    });
  }

  Future<void> _toggleDarkMode() async {
    // Função que ativa o tema escuro
    setState(() {
      _darkMode = !_darkMode; // Inverte o valor da bool ao clicar no switch
    });

    // Salvar a preferência do modo escuro para o usuário específico no SharedPreferences
    if (userID != -1) {
      // Verifica se o id é diferente do padrão
      _prefs = await SharedPreferences.getInstance();
      await _prefs.setBool('darkMode_$userID', _darkMode);
    }
  }

  Future<void> _changeFontSize(double newSize) async {
    // Função para mudar o tamanho da fonte
    setState(() {
      _fontSize = newSize;
    });

    // Salvar a preferência do tamanho da fonte para o usuário específico no SharedPreferences
    if (userID != -1) {
      // Verifica se o id é diferente do padrão
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('fontSize_$userID', newSize);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: _darkMode ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Home",
              style: TextStyle(fontSize: selectedFontSize),
            ),
          ),
          body: Column(
            children: [
              Container(
                child: Text(
                  "Bem-Vindo",
                  style: TextStyle(fontSize: selectedFontSize),
                ),
              ),
              Container(
                  // Container com a opção para habilitar ou desabilitar o modo escuro
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      "Modo Escuro: ",
                      style: TextStyle(fontSize: selectedFontSize),
                    ),
                    Switch(
                      value: _darkMode,
                      onChanged: (value) {
                        _toggleDarkMode();
                      },
                    )
                  ],
                ),
              )),
              Container(
                // Container com a opção para mudar o tamanho da fonte
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      "Tamanho da fonte: ",
                      style: TextStyle(fontSize: selectedFontSize),
                    ),
                    DropdownButton<double>(
                      // Caixa de seleção com os tamanhos disponiveis
                      value: selectedFontSize, // O valor selecionado será o tamanho da fonte
                      items: fontSizes.map((double size) {
                        return DropdownMenuItem<double>(
                          value: size, 
                          child: Text(
                            size.toString(),
                            style: TextStyle(fontSize: selectedFontSize),
                          ),
                        );
                      }).toList(),
                      onChanged: (double? value) {
                        if (value != null) {
                          setState(() {
                            selectedFontSize = value;
                          });
                          _changeFontSize(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
