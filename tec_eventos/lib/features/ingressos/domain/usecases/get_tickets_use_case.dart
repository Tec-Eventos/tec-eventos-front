import 'package:tec_eventos/features/ingressos/domain/entities/ticket.dart';
import 'package:tec_eventos/features/ingressos/domain/repositories/tickets_repository.dart';

/// Caso de uso encarregado de obter os ingressos dinamicamente.
class GetTicketsUseCase {
  final ITicketsRepository _repository;

  GetTicketsUseCase(this._repository);

  /// Executa a busca dos ingressos personalizando-os com os dados de sessão do usuário.
  Future<List<Ticket>> execute({
    required String userName,
    required String userRole,
  }) async {
    return await _repository.getTickets(
      userName: userName,
      userRole: userRole,
    );
  }
}
