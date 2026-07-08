import 'package:tec_eventos/features/ingressos/domain/entities/ticket.dart';

/// Contrato para o repositório de ingressos e controle de presença.
abstract class ITicketsRepository {
  /// Obtém a lista de ingressos do usuário conectado na sessão.
  ///
  /// Pode lançar uma [Failure] em caso de problemas de rede ou persistência.
  Future<List<Ticket>> getTickets({
    required String userName,
    required String userRole,
  });
}
