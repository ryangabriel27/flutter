class Filme {
  final String? id;
  final String nome;
  final String categoria;
  final int duracao;
  final int ano;
  final int classificacao;

  Filme(
      {this.id,
      required this.nome,
      required this.categoria,
      required this.duracao,
      required this.ano,
      required this.classificacao});

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
        id: json['id'],
        nome: json['nome'],
        categoria: json['categoria'],
        duracao: json['duracao'],
        ano: json['ano'],
        classificacao: json['classificacao']);
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'categoria': categoria,
      'duracao': duracao,
      'ano': ano,
      'classificacao': classificacao
    };
  }
}
