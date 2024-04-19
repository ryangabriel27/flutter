import 'package:flutter/material.dart';
import 'package:sa3/Controller/dbController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.usuario});
  String usuario;
  @override
  _HomePageState createState() => _HomePageState(
      usuario:
          usuario); // Passa o usuario como parâmetro para o State da página
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.usuario}); // Construtor
  String usuario;
  late SharedPreferences _prefs; // SharedPreferences
  final dbHelper = DatabaseHelper(); // Instancia do dbController
  List<bool> _treinos = [false, false, false, false, false, false];
  List<String> _nomeTreinos = [
    "Peito",
    "Costas",
    "Pernas",
    "Braço",
    "Ombros",
    "Corrida"
  ];
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    loadPreferences(); // Carrega as preferências de acordo com o id do usuário
  }

  void loadPreferences() async {
    // Função que carrega as preferências
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < _treinos.length; i++) {
        _treinos[i] = _prefs.getBool('treino${i}_${usuario}') ?? false;
      }
      _darkMode = _prefs.getBool('darkMode_${usuario}') ?? false;
    });
  }

  Future<void> _marcaTreinoConcluido(int indice) async {
    // Função que marca o treino como concluído
    setState(() {
        _treinos[indice] = !_treinos[indice]; // Inverte o valor da propriedade concluida. Se for true vira false e vice-versa
    });
    // Salvar a preferência do treino para o usuário específico no SharedPreferences
    if (usuario.isNotEmpty) {
      _prefs = await SharedPreferences.getInstance();
      await _prefs.setBool(
          'treino${indice}_${usuario}',
          _treinos[indice]
          ); // Define o valor para a boolean a o usuario com o Id especifico
    }
  }

  Future<void> _ativarModoEscuro() async {
    // Função que marca o treino como concluído
    setState(() {
      _darkMode = !_darkMode; // Inverte o valor da bool ao clicar no switch
    });
    // Salvar a preferência do modo escuro para o usuário específico no SharedPreferences
    if (usuario.isNotEmpty) {
      _prefs = await SharedPreferences.getInstance();
      await _prefs.setBool('darkMode_${usuario}',
          _darkMode); // Define o valor para a boolean a o usuario com o Id especifico
    }
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
          title: Text('Meus Treinos'), // Título da barra de aplicativos
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: _treinos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Treino de ${_nomeTreinos[index]}"),
                        leading: Checkbox(
                          value: _treinos[index],
                          onChanged: (value) {
                            _marcaTreinoConcluido(index);
                            if (_treinos[index]) {
                              showDialog(
                                // Notifica o usuario
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Concluido'),
                                  content: Text('Treino feito, Parabéns!!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Fecha o AlertDialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                  // Container com a opção para habilitar ou desabilitar o modo escuro
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      "Modo Escuro: "
                    ),
                    Switch(
                      value: _darkMode,
                      onChanged: (value) {
                        _ativarModoEscuro();
                      },
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
