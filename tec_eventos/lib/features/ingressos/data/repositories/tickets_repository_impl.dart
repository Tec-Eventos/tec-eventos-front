import 'package:tec_eventos/features/ingressos/domain/entities/ticket.dart';
import 'package:tec_eventos/features/ingressos/domain/repositories/tickets_repository.dart';

/// Implementação concreta do repositório de ingressos.
///
/// Fornece ingressos dinâmicos baseados no nome do portador e seu tipo de usuário.
class TicketsRepositoryImpl implements ITicketsRepository {
  @override
  Future<List<Ticket>> getTickets({
    required String userName,
    required String userRole,
  }) async {
    // Simula um pequeno delay de rede
    await Future.delayed(const Duration(milliseconds: 100));

    return [
      Ticket(
        id: '1',
        userName: userName,
        userRole: userRole,
        eventName: 'V Encontro de Tecnologia',
        organizerLogoUrl: 'assets/UnivemImagem.png',
        eventDate: '28 de Outubro às 19:30',
        barcodeData: 'TICKET-$userName-${DateTime.now().year}',
        qrcodeData: 'PRESENCA-$userName',
      )
    ];
  }
}
