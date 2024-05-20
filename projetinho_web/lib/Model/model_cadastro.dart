class Cadastro {
  int id;
  String nome;

  Cadastro({required this.id, required this.nome});

  // factory Filme.fromJson(Map<String, dynamic> json) {
  //   return Filme(
  //     nome: json['nome'],
  //     categoria: json['categoria'],
  //     sinopse: json['sinopse'],
  //     duracao: json['duracao'],
  //     ano: json['ano'],
  //     classificacao: json['classificacao'],
  //     elenco: json['elenco'],
  //     imagens: json['imagens'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'nome': nome,
  //     'categoria': categoria,
  //     'sinopse': sinopse,
  //     'duracao': duracao,
  //     'ano': ano,
  //     'classificacao': classificacao,
  //     'elenco': elenco,
  //     'imagens': imagens,
  //   };
  // }

  factory Cadastro.fromJson(Map<String, dynamic> json) {
    return Cadastro(
      id: json['id'],
      nome: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }

}
