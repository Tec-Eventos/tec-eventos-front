import 'dart:async';
import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/core/network/http_client_provider.dart';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/domain/repositories/events_repository.dart';
import 'package:tec_eventos/features/events/data/repositories/events_repository_impl.dart';
import 'package:tec_eventos/features/events/domain/usecases/get_aluno_events_use_case.dart';
import 'package:tec_eventos/features/events/domain/usecases/get_escola_events_use_case.dart';
import 'package:tec_eventos/features/events/domain/usecases/post_event_use_case.dart';

part 'events_provider.g.dart';

/// Provider que expõe a implementação concreta de [IEventsRepository].
@riverpod
IEventsRepository eventsRepository(Ref ref) {
  final httpClient = ref.watch(httpClientProvider);
  return EventsRepositoryImpl(httpClient);
}

/// Provider para o caso de uso [GetAlunoEventsUseCase].
@riverpod
GetAlunoEventsUseCase getAlunoEventsUseCase(Ref ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return GetAlunoEventsUseCase(repository);
}

/// Provider para o caso de uso [GetEscolaEventsUseCase].
@riverpod
GetEscolaEventsUseCase getEscolaEventsUseCase(Ref ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return GetEscolaEventsUseCase(repository);
}

/// Provider para o caso de uso [PostEventUseCase].
@riverpod
PostEventUseCase postEventUseCase(Ref ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return PostEventUseCase(repository);
}

/// Provider reativo que expõe a lista de eventos voltados ao Aluno logado.
@riverpod
FutureOr<List<AppEvent>> alunoEventsList(Ref ref) async {
  final authStateAsync = ref.watch(authProvider);
  final auth = authStateAsync.value;
  if (auth == null || !auth.isAuthenticated) {
    return [];
  }

  final useCase = ref.watch(getAlunoEventsUseCaseProvider);
  return await useCase.execute(auth.rm ?? 0);
}

/// Provider reativo que expõe a lista de eventos cadastrados pela Instituição logada.
@riverpod
FutureOr<List<AppEvent>> escolaEventsList(Ref ref) async {
  final authStateAsync = ref.watch(authProvider);
  final auth = authStateAsync.value;
  if (auth == null || !auth.isAuthenticated) {
    return [];
  }

  final useCase = ref.watch(getEscolaEventsUseCaseProvider);
  return await useCase.execute(auth.cdEscolar ?? 0);
}

/// Notifier que controla o estado de postagem/criação de um novo evento.
@riverpod
class CreateEventState extends _$CreateEventState {
  @override
  FutureOr<void> build() {
    // Estado inicial livre
  }

  /// Executa a criação do evento e invalida o feed para forçar recarga automática.
  Future<void> submitEvent({
    required AppEvent event,
    required File imagePrincipal,
    required File imageLogo,
    required String qrCode,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(postEventUseCaseProvider);
      await useCase.execute(
        event: event,
        imagePrincipal: imagePrincipal,
        imageLogo: imageLogo,
        qrCode: qrCode,
      );

      // Invalida as listas de eventos para atualizar os feeds automaticamente
      ref.invalidate(alunoEventsListProvider);
      ref.invalidate(escolaEventsListProvider);
    });
  }
}
