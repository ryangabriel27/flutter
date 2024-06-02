import 'package:projeto_json_web/Model/filme_model.dart';
import 'package:projeto_json_web/Service/filme_service.dart';

class FilmeController {
  List<Filme> listFilmes = [];
  final FilmeService _service = FilmeService();

  Future<void> getFromFilmeFromService() async {
    try {
      listFilmes = await _service.getFilmes();
      print('List of filmes: $listFilmes'); // Log para ver a lista de filmes
    } catch (e) {
      print('Error fetching filmes: $e'); // Log para ver o erro
    }
  }

  Future<void> addFilme(Filme filme) async {
    try {
      Filme newFilme = await _service.postFilme(filme);
      listFilmes.add(newFilme);
      print('Filme added: $newFilme');
    } catch (e) {
      print('Error adding filme: $e');
    }
  }

  Future<void> deleteFilme(String id) async {
    try {
      await _service.deleteFilme(id);
      listFilmes.removeWhere((filme) => filme.id == id);
      print('Filme deleted with id: $id');
    } catch (e) {
      print('Error deleting filme: $e');
    }
  }
}
