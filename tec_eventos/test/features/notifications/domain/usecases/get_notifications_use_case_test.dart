import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/notifications/domain/entities/app_notification.dart';
import 'package:tec_eventos/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:tec_eventos/features/notifications/domain/usecases/get_notifications_use_case.dart';

class MockNotificationsRepository extends Mock implements INotificationsRepository {}

void main() {
  late MockNotificationsRepository mockRepository;
  late GetNotificationsUseCase useCase;

  setUp(() {
    mockRepository = MockNotificationsRepository();
    useCase = GetNotificationsUseCase(mockRepository);
  });

  final tNotifications = [
    const AppNotification(
      id: '1',
      avatarUrl: 'assets/imgPerfil.png',
      userName: 'Gabriel',
      subtitle: 'Desempregado',
      isFollowing: false,
      dateGroup: 'Este mês',
    ),
  ];

  test('deve retornar a lista de notificacoes do repositorio com sucesso', () async {
    // Arrange
    when(() => mockRepository.getNotifications()).thenAnswer((_) async => tNotifications);

    // Act
    final result = await useCase.execute();

    // Assert
    expect(result, tNotifications);
    verify(() => mockRepository.getNotifications()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
