/// Representa um ingresso (ticket) adquirido pelo aluno para um evento.
///
/// Agrupa os dados do portador, do evento correspondente e os códigos de validação (barra e QR).
class Ticket {
  /// Identificador único do ingresso.
  final String id;

  /// Nome do portador do ingresso.
  final String userName;

  /// Categoria do portador (ex: 'Aluno', 'Instituição').
  final String userRole;

  /// Nome do evento vinculado ao ingresso.
  final String eventName;

  /// Caminho do asset ou URL do logotipo do organizador.
  final String organizerLogoUrl;

  /// Data de realização do evento formatada para exibição.
  final String eventDate;

  /// Conteúdo para geração do código de barras de validação.
  final String barcodeData;

  /// Conteúdo para geração do QR Code de presença.
  final String qrcodeData;

  /// Construtor padrão do ingresso.
  const Ticket({
    required this.id,
    required this.userName,
    required this.userRole,
    required this.eventName,
    required this.organizerLogoUrl,
    required this.eventDate,
    required this.barcodeData,
    required this.qrcodeData,
  });
}
