class Produtos {
  final String nome;
  final double preco;
  final String categoria;


  Produtos({required this.nome, required this.preco, required this.categoria});


  factory Produtos.fromJson(Map<String, dynamic> json) {
    return Produtos(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
    };
  }
}

