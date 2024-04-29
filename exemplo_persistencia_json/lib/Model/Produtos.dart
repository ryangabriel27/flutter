class Produtos {
  final String nome;
  final double preco;
  final String categoria;
  final String foto;


  Produtos({required this.nome, required this.preco, required this.categoria, required this.foto});


  factory Produtos.fromJson(Map<String, dynamic> json) {
    return Produtos(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
      foto: json['foto'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
      'foto': foto
    };
  }
}
