import 'package:app_lista1/tarefa_model.dart';
import 'package:flutter/material.dart';

class ListaTarefasController extends ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  // Métodos CRUD:
  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty) {
      _tarefas.add(Tarefa(descricao.trim(), false));
      notifyListeners();
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = !_tarefas[indice]
          .concluida; // Inverte o valor da propriedade concluida. Se for true vira false e vice-versa
      notifyListeners();
    }
  }
  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }
}
