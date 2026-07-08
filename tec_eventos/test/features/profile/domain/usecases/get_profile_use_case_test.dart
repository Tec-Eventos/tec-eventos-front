import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';
import 'package:tec_eventos/features/profile/domain/repositories/profile_repository.dart';
import 'package:tec_eventos/features/profile/domain/usecases/get_profile_use_case.dart';

class MockProfileRepository extends Mock implements IProfileRepository {}

void main() {
  late MockProfileRepository mockRepository;
  late GetProfileUseCase useCase;

  setUp(() {
    mockRepository = MockProfileRepository();
    useCase = GetProfileUseCase(mockRepository);
  });

  const tProfile = UserProfile(
    name: 'Gabriel Felix',
    email: 'gabriel123@etec.com',
    phone: '+55 (14) 997684312',
    identificationCode: '21091',
    institutionName: 'Etec Antonio Devisate',
    city: 'Marília, SP',
    profession: 'Desempregado',
    avatarUrl: 'assets/imgPerfil.png',
    followingCount: 1000,
    followersCount: 1000,
  );

  test('deve retornar as informacoes de perfil do repositorio com sucesso', () async {
    // Arrange
    when(() => mockRepository.getProfile()).thenAnswer((_) async => tProfile);

    // Act
    final result = await useCase.execute();

    // Assert
    expect(result, tProfile);
    verify(() => mockRepository.getProfile()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
