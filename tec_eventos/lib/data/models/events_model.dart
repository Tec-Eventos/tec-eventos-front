class EventsModel {
  final int cdEvento;
  final String nomeEvento;
  final int cdInstituicao;
  final String dataEvento;
  final String horario;
  final int quantidadeIngressos;
  final String descricao;
  final String cepEvento;
  final String instituicao;
  final String tipoInstituicao;
  final String imagemEvento;
  final String logoEvento;

  EventsModel({
    required this.cdEvento,
    required this.nomeEvento,
    required this.cdInstituicao,
    required this.dataEvento,
    required this.horario,
    required this.quantidadeIngressos,
    required this.descricao,
    required this.cepEvento,
    required this.instituicao,
    required this.tipoInstituicao,
    required this.imagemEvento,
    required this.logoEvento,
  });

  factory EventsModel.fromMap(Map<String, dynamic> map) {
    return EventsModel(
      cdEvento: map['cd_evento'],
      nomeEvento: map['nome_evento'],
      cdInstituicao: map['cd_instituicao'],
      dataEvento: map['data_evento'],
      horario: map['horario'],
      quantidadeIngressos: map['quantidade_ingressos'],
      descricao: map['descricao'],
      cepEvento: map['cep_evento'],
      instituicao: map['instituicao'],
      tipoInstituicao: map['tipo_instituicao'],
      imagemEvento: map['imagem_evento'],
      logoEvento: map['logo_evento'],
    );
  }
}
