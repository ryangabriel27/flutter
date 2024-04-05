class Cadastro {
  int? id;
  String usuario;
  String senha;
  String email;

  Cadastro(
      {this.id,required this.usuario, required this.senha, required this.email});

  // Método para converter um contato para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuario': usuario,
      'email': email,
      'senha': senha
    };
  }

  // Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory Cadastro.fromMap(Map<String, dynamic> map) {
    return Cadastro(
      id: map['id'],
      usuario: map['nome'],
      email: map['email'],
      senha: map['senha']
    );
  }
}
