import 'package:projeto_tempo_api/Model/city_db_model.dart';
import 'package:projeto_tempo_api/Service/city_db_service.dart';

class CityDbController {
  //  Atributos
  List<CityDb> _listCity = [];
  final CityDbService _dbService = CityDbService();
  List<CityDb> getCities() => _listCity;

  // Métodos
  Future<List<CityDb>> getAllCities() async {
    try {
      List<Map<String, dynamic>> maps = await _dbService.getAllCities();
      for (Map<String, dynamic> map in maps) {
        _listCity.add(CityDb.fromMap(map));
      }
      return _listCity;
    } catch (e) {
      print(e);
      return _listCity;
    }
  }

  // getCity
  Future<CityDb?> getCity(String cityName) async {
    try {
      List<Map<String, dynamic>> map = await _dbService.getCityByName(cityName);
      return CityDb.fromMap(map.first);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Create
  Future<void> create(CityDb city) async {
    try {
      await _dbService.create(city);
      print("Adicionado na lista!");
    } catch (e) {
      print(e);
    }
  }

  // Update
  Future<void> update(CityDb city) async {
    try {
      await _dbService.update(city);
      print("Atualizado na lista!");
    } catch (e) {
      print(e);
    }
  }
}
