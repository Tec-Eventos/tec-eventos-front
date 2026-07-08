import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';
import 'package:tec_eventos/features/profile/domain/repositories/profile_repository.dart';

/// Caso de uso encarregado de obter os dados atuais de perfil do usuário.
class GetProfileUseCase {
  final IProfileRepository _repository;

  /// Inicializa o caso de uso injetando o repositório correspondente.
  GetProfileUseCase(this._repository);

  /// Executa a busca do perfil.
  ///
  /// Retorna o [UserProfile] do usuário ativo ou lança uma [Failure].
  Future<UserProfile> execute() async {
    return await _repository.getProfile();
  }
}
