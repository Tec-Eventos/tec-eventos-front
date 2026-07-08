/// Entidade que representa um Evento na plataforma.
///
/// Unifica as propriedades de eventos consumidos por alunos e instituições.
class AppEvent {
  /// Código identificador único do evento.
  final int cdEvento;

  /// Nome ou título do evento.
  final String nomeEvento;

  /// Código da instituição organizadora.
  final int cdInstituicao;

  /// Data de realização.
  final String dataEvento;

  /// Horário de realização.
  final String horario;

  /// Quantidade total de ingressos disponibilizados.
  final int quantidadeIngressos;

  /// Descrição detalhada do evento.
  final String descricao;

  /// Local CEP do evento.
  final String cepEvento;

  /// Preço unitário do ingresso.
  final double preco;

  /// Senha opcional para acesso a eventos privados.
  final String senhaEvento;

  /// Nome da instituição organizadora por extenso.
  final String instituicao;

  /// Categoria ou tipo de instituição (ex: 'Escola Técnica').
  final String tipoInstituicao;

  /// Caminho da imagem principal de capa do evento.
  final String imagemEvento;

  /// Caminho do logotipo do evento.
  final String logoEvento;

  /// Construtor padrão da entidade de Evento.
  const AppEvent({
    required this.cdEvento,
    required this.nomeEvento,
    required this.cdInstituicao,
    required this.dataEvento,
    required this.horario,
    required this.quantidadeIngressos,
    required this.descricao,
    required this.cepEvento,
    required this.preco,
    required this.senhaEvento,
    required this.instituicao,
    required this.tipoInstituicao,
    required this.imagemEvento,
    required this.logoEvento,
  });

  /// Factory para construir a entidade a partir de uma estrutura de dados Map.
  factory AppEvent.fromMap(Map<String, dynamic> map) {
    return AppEvent(
      cdEvento: map['cd_evento'] ?? 0,
      nomeEvento: map['nome_evento'] ?? '',
      cdInstituicao: map['cd_instituicao'] ?? 0,
      dataEvento: map['data_evento'] ?? '',
      horario: map['horario'] ?? '',
      quantidadeIngressos: map['quantidade_ingressos'] ?? 0,
      descricao: map['descricao'] ?? '',
      cepEvento: map['cep_evento'] ?? map['cep'] ?? '',
      preco: (map['preco'] != null) ? (map['preco'] * 1.0) : 0.0,
      senhaEvento: map['senha_evento'] ?? map['senha'] ?? '',
      instituicao: map['instituicao'] ?? '',
      tipoInstituicao: map['tipo_instituicao'] ?? '',
      imagemEvento: map['imagem_evento'] ?? map['imagem'] ?? '',
      logoEvento: map['logo_evento'] ?? '',
    );
  }

  /// Converte a entidade em uma estrutura Map para envio de dados à API.
  Map<String, dynamic> toMap() {
    return {
      'cd_evento': cdEvento,
      'nome_evento': nomeEvento,
      'cd_instituicao': cdInstituicao,
      'data_evento': dataEvento,
      'horario': horario,
      'quantidade_ingressos': quantidadeIngressos,
      'descricao': descricao,
      'cep_evento': cepEvento,
      'preco': preco,
      'senha': senhaEvento,
      'instituicao': instituicao,
      'tipo_instituicao': tipoInstituicao,
      'imagem_evento': imagemEvento,
      'logo_evento': logoEvento,
    };
  }
}
