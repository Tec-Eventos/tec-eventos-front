class InstituicaoModel {
  final int cdEscolar;
  final int cnpj;
  final String instituicao;
  final String tipoInstituicao;
  final int cepInst;
  final String telefone;
  final String email;
  final String senha;

  InstituicaoModel(
      {required this.cdEscolar,
      required this.cnpj,
      required this.instituicao,
      required this.tipoInstituicao,
      required this.cepInst,
      required this.telefone,
      required this.email,
      required this.senha});

  factory InstituicaoModel.fromMap(Map<String, dynamic> map) {
    return InstituicaoModel(
      cdEscolar: map['cd_escolar'],
      cnpj: map['cnpj'],
      instituicao: map['instituicao'],
      tipoInstituicao: map['tipo_universidade'],
      cepInst: map['cep_inst'],
      telefone: map['telefone'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}
