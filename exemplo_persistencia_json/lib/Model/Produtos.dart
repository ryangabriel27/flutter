class Produtos {
  final String nome;
  final double preco;
  final String categoria;

  Produtos({required this.nome, required this.preco, required this.categoria});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
    };
  }

  factory Produtos.fromJson(Map<String, dynamic> map) {
    return Produtos(
        nome: map['nome'], preco: map['preco'], categoria: map['categoria']);
  }
}
