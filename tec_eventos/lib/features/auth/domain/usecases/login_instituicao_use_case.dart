import 'package:tec_eventos/core/auth/auth_state.dart';
import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';

/// Caso de uso encarregado de efetuar login da Instituição.
class LoginInstituicaoUseCase {
  final IAuthRepository _repository;

  LoginInstituicaoUseCase(this._repository);

  /// Executa o login com os dados fornecidos.
  Future<AuthState> execute({
    required String instituicao,
    required String email,
    required int cdEscolar,
    required String senha,
  }) async {
    return await _repository.loginInstituicao(
      instituicao: instituicao,
      email: email,
      cdEscolar: cdEscolar,
      senha: senha,
    );
  }
}
