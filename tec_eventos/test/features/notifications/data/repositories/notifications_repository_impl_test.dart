import 'package:flutter_test/flutter_test.dart';
import 'package:tec_eventos/features/notifications/data/repositories/notifications_repository_impl.dart';

void main() {
  late NotificationsRepositoryImpl repository;

  setUp(() {
    repository = NotificationsRepositoryImpl();
  });

  group('getNotifications', () {
    test('deve retornar a lista de notificacoes mockadas com sucesso', () async {
      // Act
      final result = await repository.getNotifications();

      // Assert
      expect(result, isNotEmpty);
      expect(result.first.userName, 'Gabriel');
      expect(result.first.isFollowing, false);
    });
  });

  group('toggleFollow', () {
    test('deve alternar e retornar o novo status isFollowing para um ID valido', () async {
      // Arrange
      const targetId = '1';

      // Act
      final initialList = await repository.getNotifications();
      final initialStatus = initialList.firstWhere((item) => item.id == targetId).isFollowing;

      final result = await repository.toggleFollow(targetId);

      // Assert
      expect(result, !initialStatus);
      
      final updatedList = await repository.getNotifications();
      final updatedStatus = updatedList.firstWhere((item) => item.id == targetId).isFollowing;
      expect(updatedStatus, result);
    });

    test('deve lancar uma excecao quando o ID fornecido nao existir', () async {
      // Arrange
      const invalidId = '999';

      // Act & Assert
      expect(
        () => repository.toggleFollow(invalidId),
        throwsA(isA<Exception>()),
      );
    });
  });
}
