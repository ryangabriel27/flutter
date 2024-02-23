import 'dart:js';

import 'package:app_lista_compra/compras_model.dart';
import 'package:flutter/material.dart';

class ListaComprasController extends ChangeNotifier {
  List<Compra> _compras = [];

  List<Compra> get compras => _compras;

  // Métodos CRUD:
  void adicionarCompra(String nome) {
    bool adicionado = false;
    if (nome.trim().isNotEmpty) {
      for (var compra in _compras) {
        // Percorre a lista de compras e verifica se o item ja foi adicionado
        if (nome.trim() == compra.nomeDoProduto) {
          adicionado = true; 
        }
      }
      if (!adicionado) {
        // Se o item não foi adicionado, então adiciona
        _compras.add(Compra(nome.trim(), false));
        notifyListeners();
      } 
    } 
  }

  void marcarComoConcluida(int indice) { // Método para marcar uma compra concluida
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].comprada = !_compras[indice]
          .comprada; // Inverte o valor da propriedade concluida. Se for true vira false e vice-versa
      notifyListeners();
    }
  }

  void excluirCompra(int indice) { 
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      notifyListeners();
    }
  }
}
