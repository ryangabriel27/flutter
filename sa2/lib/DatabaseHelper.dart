import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:sa2/Model/Cadastro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'usuarios.db';
  static const String TABLE_NAME = 'usuarios';
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, usuario TEXT, email TEXT, senha TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(join(await getDatabasesPath(), DATABASE_NAME),
        onCreate: ((db, version) {
      return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
    }), version: 1);
  }

  // Método para criar um novo contato no banco de dados
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
    try {
      final Database db = await _getDatabase();
      var res = await db.rawQuery(
          "SELECT id FROM usuarios WHERE usuario = ? AND senha = ?",
          [nome, senha]);
      if (res.isNotEmpty) {
        // Obtém o ID do usuário a partir da consulta
        dynamic idUsuario = res.first['id'];
        if (idUsuario != null && idUsuario is int) {
          // Salvando o ID do usuário no SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('userID', idUsuario);

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

  Future<Object?> getUsuario(int id) async {
    try {
      final Database db = await _getDatabase();
      var res = await db
          .rawQuery("SELECT usuario FROM usuarios WHERE id = ?", [id]);
      if (res.isNotEmpty) {
        // Retorna o nome do usuário se encontrado
        return res.first['usuario'];
      } else {
        // Retorna uma string vazia ou null se o usuário não for encontrado
        return null;
      }
    } catch (ex) {
      print("Erro ao obter o nome do usuário por ID: $ex");
      return null;
    }
  }

  Future<bool> login(String nome, String senha) async {
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

  // Método para obter todos os contatos do banco de dados
  Future<List<Cadastro>> getContacts() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME); // Consulta todos os contatos na tabela

      return List.generate(
        maps.length,
        (i) {
          return Cadastro.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos ContactModel
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // Método para atualizar um contato no banco de dados
  Future<void> update(Cadastro model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?", // Condição para atualizar o contato com base no ID
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para excluir um contato do banco de dados
  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NAME,
        where: "id = ?", // Condição para excluir o contato com base no ID
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
