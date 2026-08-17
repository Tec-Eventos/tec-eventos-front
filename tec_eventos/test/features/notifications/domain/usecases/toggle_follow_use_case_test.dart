import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:tec_eventos/features/notifications/domain/usecases/toggle_follow_use_case.dart';

class MockNotificationsRepository extends Mock implements INotificationsRepository {}

void main() {
  late MockNotificationsRepository mockRepository;
  late ToggleFollowUseCase useCase;

  setUp(() {
    mockRepository = MockNotificationsRepository();
    useCase = ToggleFollowUseCase(mockRepository);
  });

  const tUserId = '1';

  test('deve retornar true quando o repositorio confirmar o seguir com sucesso', () async {
    // Arrange
    when(() => mockRepository.toggleFollow(tUserId)).thenAnswer((_) async => true);

    // Act
    final result = await useCase.execute(tUserId);

    // Assert
    expect(result, true);
    verify(() => mockRepository.toggleFollow(tUserId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('deve retornar false quando o repositorio confirmar o unfollow com sucesso', () async {
    // Arrange
    when(() => mockRepository.toggleFollow(tUserId)).thenAnswer((_) async => false);

    // Act
    final result = await useCase.execute(tUserId);

    // Assert
    expect(result, false);
    verify(() => mockRepository.toggleFollow(tUserId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
