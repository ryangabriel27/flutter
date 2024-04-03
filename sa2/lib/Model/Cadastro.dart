class Cadastro {
  int? id;
  String nome;
  String senha;
  String email;

  Cadastro(
      {required this.nome, required this.senha, required this.email});

  // Método para converter um contato para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'name': nome,
      'email': email,
      'senha': senha
    };
  }

  // Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory Cadastro.fromMap(Map<String, dynamic> map) {
    return Cadastro(
      nome: map['nome'],
      email: map['email'],
      senha: map['senha']
    );
  }
}
