class AlunoModel {
  AlunoModel({
    required this.rmAluno,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.cepAluno,
    required this.senha,
    required this.cdEscolar,
  });

  final int rmAluno;
  final String nome;
  final String email;
  final String telefone;
  final String cepAluno;
  final String senha;
  final int cdEscolar;

  factory AlunoModel.fromJson(Map<String, dynamic> json) => AlunoModel(
        rmAluno: json["rm_aluno"],
        nome: json["nome"],
        email: json["email"],
        telefone: json["telefone"],
        cepAluno: json["cep_aluno"],
        senha: json["senha"],
        cdEscolar: json["cd_escolar"],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['rm_aluno'] = rmAluno;
    data['nome'] = nome;
    data['email'] = email;
    data['telefone'] = telefone;
    data['cep_aluno'] = cepAluno;
    data['senha'] = senha;
    data['cd_escolar'] = cdEscolar;
    return data;
  }
}
