import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';

/// Caso de uso encarregado de cadastrar um novo Aluno.
class RegisterAlunoUseCase {
  final IAuthRepository _repository;

  RegisterAlunoUseCase(this._repository);

  /// Executa o cadastro com as informações do Aluno.
  Future<void> execute({
    required String nome,
    required String email,
    required String telefone,
    required String cep,
    required int cdEscolar,
    required int rm,
    required String senha,
  }) async {
    return await _repository.registerAluno(
      nome: nome,
      email: email,
      telefone: telefone,
      cep: cep,
      cdEscolar: cdEscolar,
      rm: rm,
      senha: senha,
    );
  }
}
