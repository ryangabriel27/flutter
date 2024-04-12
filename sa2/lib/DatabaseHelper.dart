import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:sa2/Model/Cadastro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'usuarios.db';
  static const String TABLE_NAME = 'usuarios';
  static const String CREATE_USERS_TABLE_SCRIPT =
      "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, usuario TEXT, email TEXT, senha TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(join(await getDatabasesPath(), DATABASE_NAME),
        onCreate: ((db, version) {
      return db.execute(CREATE_USERS_TABLE_SCRIPT);
    }), version: 1);
  }

  // Método para criar um novo usuario no banco de dados
  Future<void> create(Cadastro model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(TABLE_NAME, model.toMap());
      //Insere o cadastro no banco de dados
      print("Cadastrado com sucesso");
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<void> salvaId(String nome, String senha) async {
    // Método que guarda o id do usuário logado, e chama o SharedPreferences
    try {
      final Database db = await _getDatabase();
      var res = await db.rawQuery(
          "SELECT id FROM usuarios WHERE usuario = ? AND senha = ?",
          [nome, senha]);
      if (res.isNotEmpty) {
        // Obtém o ID do usuário a partir da consulta
        dynamic idUsuario = res.first['id'];
        if (idUsuario != null && idUsuario is int) {
          // Verifica se o id não é vazio e se ele é uma int
          // Salvando o ID do usuário no SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('userID',
              idUsuario); // Define a int do sharedPreferences seja igual ao id do usuário logado

          print("Usuário encontrado, ID salvo: $idUsuario");
        } else {
          print("Erro: ID do usuário não encontrado na consulta.");
        }
      } else {
        print("Usuário e/ou senha incorreta!");
      }
    } catch (ex) {
      print("Erro ao salvar ID do usuário: $ex");
    }
  }

  Future<void> getNome(String nome) async {
    // Método que guarda o id do usuário logado, e chama o SharedPreferences
    try {
      // Salvando o ID do usuário no SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nomeUsuario', nome);
    } catch (ex) {
      print("Erro ao salvar ID do usuário: $ex");
    }
  }

  Future<bool> login(String nome, String senha) async {
    // Método que faz o login, caso encontre um usuario com nome e senha iguais aos digitados pelo usuario
    try {
      final Database db = await _getDatabase();
      var res = await db.rawQuery(
          "SELECT * FROM usuarios WHERE usuario = ? AND senha = ?",
          [nome, senha]);
      if (res.isNotEmpty) {
        // Verifica se o retorno não é vazio
        print("Usuario existe, login feito!"); // Login
        return true;
      } else {
        print(res);
        print("Usuário e/ou senha incorreta!");
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
