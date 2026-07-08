import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/features/ingressos/domain/entities/ticket.dart';
import 'package:tec_eventos/features/ingressos/domain/repositories/tickets_repository.dart';
import 'package:tec_eventos/features/ingressos/data/repositories/tickets_repository_impl.dart';
import 'package:tec_eventos/features/ingressos/domain/usecases/get_tickets_use_case.dart';

part 'tickets_provider.g.dart';

/// Provider que expõe a implementação do repositório de ingressos.
@riverpod
ITicketsRepository ticketsRepository(Ref ref) {
  return TicketsRepositoryImpl();
}

/// Provider que fornece o caso de uso [GetTicketsUseCase].
@riverpod
GetTicketsUseCase getTicketsUseCase(Ref ref) {
  final repository = ref.watch(ticketsRepositoryProvider);
  return GetTicketsUseCase(repository);
}

/// Provider auto-gerado que expõe a lista de ingressos do usuário de forma reativa à sessão.
@riverpod
FutureOr<List<Ticket>> ticketsList(Ref ref) async {
  final authStateAsync = ref.watch(authProvider);

  // Aguarda a resolução da autenticação ativa
  final auth = authStateAsync.value;
  if (auth == null || !auth.isAuthenticated) {
    return [];
  }

  final useCase = ref.watch(getTicketsUseCaseProvider);
  return await useCase.execute(
    userName: auth.name ?? 'Sem Nome',
    userRole: auth.userType,
  );
}
