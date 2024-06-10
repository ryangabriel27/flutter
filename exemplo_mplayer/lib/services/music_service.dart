import 'dart:convert';

import 'package:exemplo_mplayer/model/music_model.dart';
import 'package:http/http.dart' as http;

class MusicService {
  final Uri url = Uri.parse("http://URL-FROM-JSON");

  // Fetch lista de musicas
  List<MusicModel> _listMusic = [];
  List<MusicModel> get listMusic => _listMusic;

  Future<List<MusicModel>> fetchMusic() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      _listMusic = json
          .decode(response.body)
          .map((e) => MusicModel.fromJson(e))
          .toList();
      return _listMusic;
    } else {
      throw Exception('Não foi possível conectar com o servidor');
    }
  }
}
