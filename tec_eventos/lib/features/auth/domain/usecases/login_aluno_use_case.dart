import 'package:tec_eventos/core/auth/auth_state.dart';
import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';

/// Caso de uso encarregado de efetuar login do Aluno.
class LoginAlunoUseCase {
  final IAuthRepository _repository;

  LoginAlunoUseCase(this._repository);

  /// Executa o login com os dados fornecidos.
  Future<AuthState> execute({
    required String nome,
    required String email,
    required int rm,
    required String senha,
  }) async {
    return await _repository.loginAluno(
      nome: nome,
      email: email,
      rm: rm,
      senha: senha,
    );
  }
}
