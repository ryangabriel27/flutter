import 'package:path/path.dart';
import 'package:sa2_correcao/Model/Usuario.dart';
import 'package:sqflite/sqflite.dart';

class BancoDeDadosCrud {
  static const String Nome_BD = 'usuarios.db'; // Nome do banco de dados
  static const String Nome_Tabela = 'usuarios'; // Nome da tabela
  static const String Script_Criacao_Tabela = // Script SQL para criar a tabela
      "CREATE TABLE IF usuarios(" +
          "id SERIAL PRIMARY KEY," +
          "nome TEXT, email TEXT UNIQUE, senha TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), Nome_BD), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            Script_Criacao_Tabela); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um novo contato no banco de dados
  Future<void> create(Usuario model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          Nome_Tabela, model.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os contatos do banco de dados
  Future<Usuario?> getUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(Nome_Tabela,
          where: 'email = ? AND senha = ?',
          whereArgs: [email, senha]); // Consulta todos os contatos na tabela

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

  Future<bool> existUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(Nome_Tabela,
          where: 'email = ? AND senha = ?',
          whereArgs: [email, senha]); // Consulta todos os contatos na tabela

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
