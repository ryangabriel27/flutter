class Animal {
  // Atributos
  String _especie;
  String _urlFoto;
  String _urlAudio;

  // Métodos
  // Construtor
  Animal(this._especie, this._urlFoto, this._urlAudio);

  // Getters
  String get especie => _especie;

  String get urlFoto => _urlFoto;

  String get urlAudio => _urlAudio;

  // Setters
  set especie(String novaEspecie) {
    if (novaEspecie.isNotEmpty) {
      _especie = novaEspecie;
    }
  }

  set urlFoto(String novaUrlFoto) {
    if (novaUrlFoto.isNotEmpty) {
      _urlFoto = novaUrlFoto;
    }
  }

  set urlAudio(String novaUrlAudio) {
    if (novaUrlAudio.isNotEmpty) {
      _urlAudio = novaUrlAudio;
    }
  }
}
