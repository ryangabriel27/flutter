import 'package:app_animais/model.dart';
import 'package:flutter/material.dart';

class AnimalController extends ChangeNotifier {
  List<Animal> _listaAnimal = [];

  List get listarAnimais => _listaAnimal;

  void adicionarAnimal(String especie, String urlFoto, String urlAudio) {
    if (especie.trim().isNotEmpty &&
        urlFoto.trim().isNotEmpty &&
        urlAudio.trim().isNotEmpty) {
      Animal novoAnimal =
          Animal(especie.trim(), urlFoto.trim(), urlAudio.trim());
      _listaAnimal.add(novoAnimal);
    }
  }

  void excluirAnimal(int index) {
    if (index >= 0 && index < _listaAnimal.length) {
      _listaAnimal.removeAt(index);
      notifyListeners();
    }
  }
}
