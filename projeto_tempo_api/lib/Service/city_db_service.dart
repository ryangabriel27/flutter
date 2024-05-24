import 'package:path/path.dart';
import 'package:projeto_tempo_api/Model/city_db_model.dart';
import 'package:sqflite/sqflite.dart';

class CityDbService {
  // Atributos de detalhe do banco de dados
  static const String DB_NOME = 'city.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'city'; // Nome da tabela
  static const String
      CREATE_CITY_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE city(id SERIAL, cityname TEXT UNIQUE, isfavorite INTEGER)""";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CITY_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Get All Cities
  // Future<List<ContatoModel>> getContacts() async {
  //   try {
  //     final Database db = await _getDatabase();
  //     final List<Map<String, dynamic>> maps =
  //         await db.query(TABLE_NOME); // Consulta todos os contatos na tabela

  //     return List.generate(
  //       maps.length,
  //       (i) {
  //         return ContatoModel.fromMap(maps[
  //             i]); // Converte os resultados da consulta para objetos ContactModel
  //       },
  //     );
  //   } catch (ex) {
  //     print(ex);
  //     return [];
  //   }
  // }
  //getAllCities
  Future<List<Map<String, dynamic>>> getAllCities() async {
    Database db = await _getDatabase();
    List<Map<String, dynamic>> result = await db.query(TABLE_NOME);
    db.close();
    return result;
  }

  //getCityByName
  Future<List<Map<String, dynamic>>> getCityByName(String cityName) async {
    Database db = await _getDatabase();
    List<Map<String, dynamic>> result =
        await db.query(TABLE_NOME, where: 'cityname =?', whereArgs: [cityName]);
    db.close();
    return result;
  }

  // Insert city
  Future<void> create(CityDb city) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(TABLE_NOME, city.toMap());
      db.close(); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Update city
  Future<void> update(CityDb city) async {
    try {
      final Database db = await _getDatabase();
      await db.update(TABLE_NOME, city.toMap(),
          where: 'cityname =?', whereArgs: [city.cityName, city.isFavorite]);
      db.close(); // Atualiza o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Delete city
  Future<void> delete(CityDb city) async {
    try {
      final Database db = await _getDatabase();
      await db
          .delete(TABLE_NOME, where: 'cityname =?', whereArgs: [city.cityName]);
      db.close(); // Deleta o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
