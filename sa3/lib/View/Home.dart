import 'package:flutter/material.dart';
import 'package:sa3/Controller/dbController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  String usuario;
  HomePage({required this.usuario});

  @override
  _HomePageState createState() => _HomePageState(
      usuario:
          usuario); // Passa o usuario como parâmetro para o State da página
}

class _HomePageState extends State<HomePage> {
  String usuario;
  _HomePageState({required this.usuario}); // Construtor

  late SharedPreferences _prefs; // SharedPreferences
  final dbHelper = DatabaseHelper(); // Instancia do dbController
  // Lista de treinos
  // bool _treinoBraco = false;
  // bool _treinoPeito = false;
  // bool _treinoPerna = false;
  // bool _treinoCostas = false;
  // bool _treinoOmbros = false;
  // bool _treinoCorrida = false;
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
      for (var i = 0; i <= _treinos.length; i++) {
        _treinos[i] = _prefs.getBool('treino${i}_${usuario}') ?? false;
      }
      _darkMode = _prefs.getBool("darkMode_${usuario}") ?? false;
      // _treinoBraco = _prefs.getBool('treino1_${usuario}') ??
      //     false; // Verifica se o treino foi concluido
      // _treinoPeito = _prefs.getBool('treinoPeito_${usuario}') ??
      //     false; // Verifica se o treino foi concluido
      // _treinoPerna = _prefs.getBool('treinoPerna_${usuario}') ??
      //     false; // Verifica se o treino foi concluido
      // _treinoCostas = _prefs.getBool('treinoCosta_${usuario}') ??
      //     false; // Verifica se o treino foi concluido
      // _treinoOmbros = _prefs.getBool('treinoOmbros_${usuario}') ??
      //     false; // Verifica se o treino foi concluido
      // _treinoCorrida = _prefs.getBool('treinoCorrida_${usuario}') ??
      //     false; // Verifica se o treino foi concluido
    });
  }

  Future<void> _marcaTreinoConcluido(int indice) async {
    // Função que marca o treino como concluído
    setState(() {
      if (indice >= 0 && indice <= _treinos.length) {
        _treinos[indice] = !_treinos[
            indice]; // Inverte o valor da propriedade concluida. Se for true vira false e vice-versa
      } // Inverte o valor da bool ao clicar no switch
    });
    // Salvar a preferência do treino para o usuário específico no SharedPreferences
    if (usuario.isNotEmpty) {
      _prefs = await SharedPreferences.getInstance();
      await _prefs.setBool(
          'treino${indice}_${usuario}',
          _treinos[
              indice]); // Define o valor para a boolean a o usuario com o Id especifico
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
  // Future<void> _marcaTreinoBracoConcluido() async {
  //   // Função que marca o treino como concluído
  //   setState(() {
  //     _treinoBraco =
  //         !_treinoBraco; // Inverte o valor da bool ao clicar no switch
  //   });
  //   // Salvar a preferência do treino para o usuário específico no SharedPreferences
  //   if (usuario.isNotEmpty) {
  //     // Verifica se o id é diferente do padrão
  //     _prefs = await SharedPreferences.getInstance();
  //     await _prefs.setBool('treinoBraco_${usuario}',
  //         _treinoBraco); // Define o valor para a boolean a o usuario com o Id especifico
  //   }
  // }

  // Future<void> _marcaTreinoPeitoConcluido() async {
  //   // Função que marca o treino como concluído
  //   setState(() {
  //     _treinoPeito =
  //         !_treinoPeito; // Inverte o valor da bool ao clicar no switch
  //   });
  //   // Salvar a preferência do treino para o usuário específico no SharedPreferences
  //   if (usuario.isNotEmpty) {
  //     // Verifica se o id é diferente do padrão
  //     _prefs = await SharedPreferences.getInstance();
  //     await _prefs.setBool('treinoPeito_${usuario}',
  //         _treinoPeito); // Define o valor para a boolean a o usuario com o Id especifico
  //   }
  // }

  // Future<void> _marcaTreinoPernaConcluido() async {
  //   // Função que marca o treino como concluído
  //   setState(() {
  //     _treinoPerna =
  //         !_treinoPerna; // Inverte o valor da bool ao clicar no switch
  //   });
  //   // Salvar a preferência do treino para o usuário específico no SharedPreferences
  //   if (usuario.isNotEmpty) {
  //     // Verifica se o id é diferente do padrão
  //     _prefs = await SharedPreferences.getInstance();
  //     await _prefs.setBool('treinoPerna_${usuario}',
  //         _treinoPerna); // Define o valor para a boolean a o usuario com o Id especifico
  //   }
  // }

  // Future<void> _marcaTreinoOmbrosConcluido() async {
  //   // Função que marca o treino como concluído
  //   setState(() {
  //     _treinoOmbros =
  //         !_treinoOmbros; // Inverte o valor da bool ao clicar no switch
  //   });
  //   // Salvar a preferência do treino para o usuário específico no SharedPreferences
  //   if (usuario.isNotEmpty) {
  //     // Verifica se o id é diferente do padrão
  //     _prefs = await SharedPreferences.getInstance();
  //     await _prefs.setBool('treinoOmbros_${usuario}',
  //         _treinoOmbros); // Define o valor para a boolean a o usuario com o Id especifico
  //   }
  // }

  // Future<void> _marcaTreinoCorridaConcluido() async {
  //   // Função que marca o treino como concluído
  //   setState(() {
  //     _treinoCorrida =
  //         !_treinoCorrida; // Inverte o valor da bool ao clicar no switch
  //   });
  //   // Salvar a preferência do treino para o usuário específico no SharedPreferences
  //   if (usuario.isNotEmpty) {
  //     // Verifica se o id é diferente do padrão
  //     _prefs = await SharedPreferences.getInstance();
  //     await _prefs.setBool('treinoCorrida_${usuario}',
  //         _treinoCorrida); // Define o valor para a boolean a o usuario com o Id especifico
  //   }
  // }

  // Future<void> _marcaTreinoCostasConcluido() async {
  //   // Função que marca o treino como concluído
  //   setState(() {
  //     _treinoCostas =
  //         !_treinoCostas; // Inverte o valor da bool ao clicar no switch
  //   });
  //   // Salvar a preferência do treino para o usuário específico no SharedPreferences
  //   if (usuario.isNotEmpty) {
  //     // Verifica se o id é diferente do padrão
  //     _prefs = await SharedPreferences.getInstance();
  //     await _prefs.setBool('treinoCostas_${usuario}',
  //         _treinoCostas); // Define o valor para a boolean a o usuario com o Id especifico
  //   }
  // }

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
              ListView.builder(
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
                                    Navigator.pop(
                                        context); // Fecha o AlertDialog
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
