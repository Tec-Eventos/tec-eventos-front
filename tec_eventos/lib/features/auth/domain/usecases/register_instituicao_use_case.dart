import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';

/// Caso de uso encarregado de cadastrar uma nova Instituição.
class RegisterInstituicaoUseCase {
  final IAuthRepository _repository;

  RegisterInstituicaoUseCase(this._repository);

  /// Executa o cadastro com as informações da Instituição.
  Future<void> execute({
    required String instituicao,
    required String email,
    required String telefone,
    required String cep,
    required int cdEscolar,
    required String senha,
  }) async {
    return await _repository.registerInstituicao(
      instituicao: instituicao,
      email: email,
      telefone: telefone,
      cep: cep,
      cdEscolar: cdEscolar,
      senha: senha,
    );
  }
}
