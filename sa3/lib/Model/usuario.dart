class Usuario {
  int? id;
  String nome;
  String senha;
  String email;

  Usuario(
      {required this.nome,
      required this.senha,
      required this.email,
      required id});

  Map<String, dynamic> toMap() {
    return {'nome': nome, 'email': email, 'senha': senha};
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}
