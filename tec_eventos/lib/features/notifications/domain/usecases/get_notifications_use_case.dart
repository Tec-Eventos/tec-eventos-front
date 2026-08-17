import 'package:tec_eventos/features/notifications/domain/entities/app_notification.dart';
import 'package:tec_eventos/features/notifications/domain/repositories/notifications_repository.dart';

/// Caso de uso responsável por obter a lista de notificações da conta do usuário.
class GetNotificationsUseCase {
  final INotificationsRepository _repository;

  /// Inicializa o caso de uso injetando o repositório correspondente.
  GetNotificationsUseCase(this._repository);

  /// Executa a busca de notificações.
  ///
  /// Retorna uma lista de [AppNotification] ou lança um [Failure].
  Future<List<AppNotification>> execute() async {
    return await _repository.getNotifications();
  }
}
