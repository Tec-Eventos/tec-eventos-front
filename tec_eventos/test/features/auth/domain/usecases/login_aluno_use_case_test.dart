import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/core/auth/auth_state.dart';
import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';
import 'package:tec_eventos/features/auth/domain/usecases/login_aluno_use_case.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late LoginAlunoUseCase useCase;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginAlunoUseCase(mockRepository);
  });

  final tAuthState = AuthState(
    name: 'Gabriel Aluno',
    email: 'aluno@etec.com',
    rm: 21091,
    userType: 'Aluno',
  );

  test('deve chamar o repositorio para fazer login do aluno com sucesso', () async {
    // Arrange
    when(() => mockRepository.loginAluno(
          nome: any(named: 'nome'),
          email: any(named: 'email'),
          rm: any(named: 'rm'),
          senha: any(named: 'senha'),
        )).thenAnswer((_) async => tAuthState);

    // Act
    final result = await useCase.execute(
      nome: 'Gabriel Aluno',
      email: 'aluno@etec.com',
      rm: 21091,
      senha: 'password',
    );

    // Assert
    expect(result, tAuthState);
    verify(() => mockRepository.loginAluno(
          nome: 'Gabriel Aluno',
          email: 'aluno@etec.com',
          rm: 21091,
          senha: 'password',
        )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
