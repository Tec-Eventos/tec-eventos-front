import 'package:tec_eventos/core/auth/auth_state.dart';

/// Contrato para o repositório de autenticação e controle de sessões.
///
/// Define as assinaturas dos métodos de login, cadastro de alunos/instituições e logout.
abstract class IAuthRepository {
  /// Realiza o login de um Aluno na plataforma.
  Future<AuthState> loginAluno({
    required String nome,
    required String email,
    required int rm,
    required String senha,
  });

  /// Realiza o login de uma Instituição na plataforma.
  Future<AuthState> loginInstituicao({
    required String instituicao,
    required String email,
    required int cdEscolar,
    required String senha,
  });

  /// Realiza o cadastro de um novo Aluno no sistema.
  Future<void> registerAluno({
    required String nome,
    required String email,
    required String telefone,
    required String cep,
    required int cdEscolar,
    required int rm,
    required String senha,
  });

  /// Realiza o cadastro de uma nova Instituição no sistema.
  Future<void> registerInstituicao({
    required String instituicao,
    required String email,
    required String telefone,
    required String cep,
    required int cdEscolar,
    required String senha,
  });

  /// Desloga o usuário atual, limpando tokens e sessão do dispositivo.
  Future<void> logout();
}
