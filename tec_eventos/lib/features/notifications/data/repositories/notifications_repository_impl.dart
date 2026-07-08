import 'package:tec_eventos/features/notifications/domain/entities/app_notification.dart';
import 'package:tec_eventos/features/notifications/domain/repositories/notifications_repository.dart';

/// Implementação concreta do repositório de notificações.
///
/// Atualmente utiliza dados simulados (mock) em memória com atrasos de rede,
/// preparando a integração transparente com a API final.
class NotificationsRepositoryImpl implements INotificationsRepository {
  final List<AppNotification> _mockNotifications = [
    const AppNotification(id: '1', avatarUrl: 'assets/imgPerfil.png', userName: 'Gabriel', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Este mês'),
    const AppNotification(id: '2', avatarUrl: 'assets/imgPerfil.png', userName: 'Rodinei', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Este mês'),
    const AppNotification(id: '3', avatarUrl: 'assets/imgPerfil.png', userName: 'Chamego', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Este mês'),
    const AppNotification(id: '4', avatarUrl: 'assets/imgPerfil.png', userName: 'Lorosvaldo', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Este mês'),
    const AppNotification(id: '5', avatarUrl: 'assets/imgPerfil.png', userName: 'Gabriel', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Este mês'),
    const AppNotification(id: '6', avatarUrl: 'assets/imgPerfil.png', userName: 'Gabriel', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Mês anterior'),
    const AppNotification(id: '7', avatarUrl: 'assets/imgPerfil.png', userName: 'Phineas', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Mês anterior'),
    const AppNotification(id: '8', avatarUrl: 'assets/imgPerfil.png', userName: 'Ferp', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Mês anterior'),
    const AppNotification(id: '9', avatarUrl: 'assets/imgPerfil.png', userName: 'Gabriel', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Mês anterior'),
    const AppNotification(id: '10', avatarUrl: 'assets/imgPerfil.png', userName: 'Gabriel', subtitle: 'Desempregado', isFollowing: false, dateGroup: 'Mês anterior'),
  ];

  @override
  Future<List<AppNotification>> getNotifications() async {
    // Simula tempo de resposta de API
    await Future.delayed(const Duration(milliseconds: 400));
    return List.unmodifiable(_mockNotifications);
  }

  @override
  Future<bool> toggleFollow(String userId) async {
    // Simula atraso na requisição de follow
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _mockNotifications.indexWhere((item) => item.id == userId);
    if (index != -1) {
      final item = _mockNotifications[index];
      final updated = item.copyWith(isFollowing: !item.isFollowing);
      _mockNotifications[index] = updated;
      return updated.isFollowing;
    }
    throw Exception('Notificação ou usuário não encontrado para ID: $userId');
  }
}
