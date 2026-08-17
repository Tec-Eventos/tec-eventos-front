import 'package:tec_eventos/features/notifications/domain/entities/app_notification.dart';

/// Contrato para o repositório de notificações.
///
/// Define as operações de leitura e ação de seguir/deixar de seguir outros usuários.
abstract class INotificationsRepository {
  /// Obtém a lista completa de notificações para o usuário logado.
  ///
  /// Pode lançar uma [Failure] em caso de erro na comunicação.
  Future<List<AppNotification>> getNotifications();

  /// Altera o status de relacionamento (seguir/deixar de seguir) com outro usuário.
  ///
  /// Recebe o [userId] do alvo e retorna o novo estado [isFollowing].
  /// Pode lançar uma [Failure] em caso de erro na comunicação.
  Future<bool> toggleFollow(String userId);
}
