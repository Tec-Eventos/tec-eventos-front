import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';

/// Caso de uso encarregado de efetuar logout da sessão do usuário.
class LogoutUseCase {
  final IAuthRepository _repository;

  LogoutUseCase(this._repository);

  /// Executa a limpeza da sessão atual e do armazenamento persistido.
  Future<void> execute() async {
    return await _repository.logout();
  }
}
