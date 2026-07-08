import 'package:tec_eventos/features/notifications/domain/repositories/notifications_repository.dart';

/// Caso de uso responsável por seguir ou parar de seguir outro usuário.
class ToggleFollowUseCase {
  final INotificationsRepository _repository;

  /// Inicializa o caso de uso injetando o repositório correspondente.
  ToggleFollowUseCase(this._repository);

  /// Altera o estado de relacionamento com o usuário indicado por [userId].
  ///
  /// Retorna o novo estado `isFollowing` (true se está seguindo, false se não)
  /// ou lança uma [Failure] em caso de erro.
  Future<bool> execute(String userId) async {
    return await _repository.toggleFollow(userId);
  }
}
