import 'package:path/path.dart';
import 'package:sa3/Model/usuario.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'usuarios.db';
  static const String TABLE_NAME = 'usuarios';
  static const String CREATE_USERS_TABLE_SCRIPT =
      "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT UNIQUE, email TEXT, senha TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(join(await getDatabasesPath(), DATABASE_NAME),
        onCreate: ((db, version) {
      return db.execute(CREATE_USERS_TABLE_SCRIPT);
    }), version: 1);
  }

  // Método para criar um novo usuario no banco de dados
  Future<void> create(Usuario model) async {
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

  Future<Usuario?> getUsuario(String usuario, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME,
          where: 'nome = ? AND senha = ?',
          whereArgs: [usuario, senha]); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty) {
        return Usuario.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<bool> login(String nome, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME,
          where: 'nome = ? AND senha = ?',
          whereArgs: [nome, senha]); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
