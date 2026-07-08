import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tec_eventos/features/notifications/domain/entities/app_notification.dart';
import 'package:tec_eventos/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:tec_eventos/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:tec_eventos/features/notifications/domain/usecases/get_notifications_use_case.dart';
import 'package:tec_eventos/features/notifications/domain/usecases/toggle_follow_use_case.dart';

part 'notifications_provider.g.dart';

/// Provider que injeta a implementação concreta do repositório de notificações.
@riverpod
INotificationsRepository notificationsRepository(Ref ref) {
  return NotificationsRepositoryImpl();
}

/// Provider que injeta o caso de uso [GetNotificationsUseCase].
@riverpod
GetNotificationsUseCase getNotificationsUseCase(Ref ref) {
  final repository = ref.watch(notificationsRepositoryProvider);
  return GetNotificationsUseCase(repository);
}

/// Provider que injeta o caso de uso [ToggleFollowUseCase].
@riverpod
ToggleFollowUseCase toggleFollowUseCase(Ref ref) {
  final repository = ref.watch(notificationsRepositoryProvider);
  return ToggleFollowUseCase(repository);
}

/// Notifier que gerencia a lista de notificações e as atualizações de estado do relacionamento.
@riverpod
class Notifications extends _$Notifications {
  @override
  FutureOr<List<AppNotification>> build() async {
    final useCase = ref.watch(getNotificationsUseCaseProvider);
    return await useCase.execute();
  }

  /// Alterna o status de relacionamento ("Seguir"/"Seguindo") para um determinado ID de notificação.
  ///
  /// Executa uma atualização otimista na interface para melhor tempo de resposta visual
  /// e realiza o rollback em caso de falhas na camada de dados.
  Future<void> toggleFollow(String id) async {
    final currentList = state.value ?? [];

    // Executa atualização otimista local
    state = AsyncValue.data(
      currentList.map((item) {
        if (item.id == id) {
          return item.copyWith(isFollowing: !item.isFollowing);
        }
        return item;
      }).toList(),
    );

    try {
      final useCase = ref.read(toggleFollowUseCaseProvider);
      final newStatus = await useCase.execute(id);

      // Garante que o estado final seja o retornado pela API
      state = AsyncValue.data(
        currentList.map((item) {
          if (item.id == id) {
            return item.copyWith(isFollowing: newStatus);
          }
          return item;
        }).toList(),
      );
    } catch (e, stackTrace) {
      // Se houver erro, reverte para a lista anterior ao clique
      state = AsyncValue.data(currentList);
      // Atualiza o estado com o erro para que a UI possa exibir alertas
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
