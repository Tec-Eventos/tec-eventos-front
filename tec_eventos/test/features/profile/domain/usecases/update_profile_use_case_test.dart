import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';
import 'package:tec_eventos/features/profile/domain/repositories/profile_repository.dart';
import 'package:tec_eventos/features/profile/domain/usecases/update_profile_use_case.dart';

class MockProfileRepository extends Mock implements IProfileRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(const UserProfile(
      name: '',
      email: '',
      phone: '',
      identificationCode: '',
      institutionName: '',
      city: '',
      profession: '',
      avatarUrl: '',
      followingCount: 0,
      followersCount: 0,
    ));
  });

  late MockProfileRepository mockRepository;
  late UpdateProfileUseCase useCase;

  setUp(() {
    mockRepository = MockProfileRepository();
    useCase = UpdateProfileUseCase(mockRepository);
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

  test('deve chamar o repositorio para atualizar o perfil com sucesso', () async {
    // Arrange
    when(() => mockRepository.updateProfile(any())).thenAnswer((_) async => {});

    // Act
    await useCase.execute(tProfile);

    // Assert
    verify(() => mockRepository.updateProfile(tProfile)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
