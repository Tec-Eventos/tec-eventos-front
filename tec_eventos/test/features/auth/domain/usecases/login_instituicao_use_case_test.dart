import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/core/auth/auth_state.dart';
import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';
import 'package:tec_eventos/features/auth/domain/usecases/login_instituicao_use_case.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late LoginInstituicaoUseCase useCase;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginInstituicaoUseCase(mockRepository);
  });

  final tAuthState = AuthState(
    name: 'Etec Centro',
    email: 'etec@etec.com',
    cdEscolar: 1234,
    userType: 'Instituição',
  );

  test('deve chamar o repositorio para fazer login da instituicao com sucesso', () async {
    // Arrange
    when(() => mockRepository.loginInstituicao(
          instituicao: any(named: 'instituicao'),
          email: any(named: 'email'),
          cdEscolar: any(named: 'cdEscolar'),
          senha: any(named: 'senha'),
        )).thenAnswer((_) async => tAuthState);

    // Act
    final result = await useCase.execute(
      instituicao: 'Etec Centro',
      email: 'etec@etec.com',
      cdEscolar: 1234,
      senha: 'password',
    );

    // Assert
    expect(result, tAuthState);
    verify(() => mockRepository.loginInstituicao(
          instituicao: 'Etec Centro',
          email: 'etec@etec.com',
          cdEscolar: 1234,
          senha: 'password',
        )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
